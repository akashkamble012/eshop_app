class Validator {
  static String? emailValidator({required String? value}) {
    if (value == null) {
      return 'Mandatory';
    } else if (value.trim() == '') {
      return 'Don\'t leave empty';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a Valid Email Id';
    }
    return null;
  }

  ///

  static String? passwordValidation({String? value}) {
    if (value == null) {
      return 'Mandatory';
    } else if (value.trim() == '') {
      return 'Don\'t leave Empty';
    } else if (value.length < 4) {
      return 'password is too small';
    }
    return null;
  }
}
