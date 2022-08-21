import 'package:formz/formz.dart';

import '../../../../../core/Helper/validator.dart';

class Password extends FormzInput {
  const Password.pure() : super.pure('');
  const Password.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(value) {
    return Validator.passwordValidation(value: value);
  }
}
