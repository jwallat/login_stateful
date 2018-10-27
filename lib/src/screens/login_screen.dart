import "package:flutter/material.dart";
import "../mixins/validation_mixin.dart";

class LoginScreen extends StatefulWidget {
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        //autovalidate: true,
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: 25.0)),
            emailField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "you@example.com",
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String value) {
        print(value);
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Password",
      ),
      validator: validatePassword,
      onSaved: (String value) {
        print(value);
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("email: $email, password: $password");
        }
      },
      color: Colors.blue,
    );
  }
}
