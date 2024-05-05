extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(r'^(05)+[0-9]{8}$').hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r'^.{6,}$').hasMatch(this);
  }

  bool isValidName() {
    return RegExp(r'^[a-zA-Z\s]{2,}$').hasMatch(this);
  }
}
