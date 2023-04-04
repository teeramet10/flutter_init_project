class Validator {
  static bool emailValidate(String? value) {
    final RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value != null && regExp.hasMatch(value) == true) {
      return true;
    }
    return false;
  }

  static bool numberValidator(String? value) {
    final RegExp regExp = RegExp(r'[0-9]');
    if (value != null && regExp.hasMatch(value) == true) {
      return true;
    }
    return false;
  }

  static bool atLeast8CharValidator(String? value) {
    final RegExp regExp = RegExp(r'.{8,}');
    if (value != null && regExp.hasMatch(value) == true) {
      return true;
    }
    return false;
  }
}
