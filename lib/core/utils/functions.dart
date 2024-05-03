extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isValidPhone(String phoneNum) {
    return RegExp(r'^(010|05)\d{8}$').hasMatch(phoneNum);
  }

  bool isValidPassword() {
    return RegExp(r'^.{6,}$').hasMatch(this);
  }
}
