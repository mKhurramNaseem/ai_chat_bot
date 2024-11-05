class InputValidations {
   static const _requiredMessage = 'Required',
      _invalidEmailMessage = 'Enter valid email';
  static const regExpPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String? emailValidatior(String? value) {
    if (value == null || value.isEmpty) {
      return _requiredMessage;
    } else if (!RegExp(regExpPattern).hasMatch(value)) {
      return _invalidEmailMessage;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return _requiredMessage;
    }
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return _requiredMessage;
    }
    return null;
  }
}