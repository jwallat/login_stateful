class ValidationMixin {
  String validatePassword(String value) {
    return (value.length <= 4)
        ? "Passwords must be longer than 4 characters"
        : null;
  }

  String validateEmail(String value) {
    if (!value.contains("@")) {
      return "Please enter a valid email";
    }
    return null;
  }
}
