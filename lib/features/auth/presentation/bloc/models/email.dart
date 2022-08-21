import 'package:formz/formz.dart';

import '../../../../../core/Helper/validator.dart';

class Email extends FormzInput {
  const Email.pure() : super.pure('');
  const Email.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(value) {
    return Validator.emailValidator(value: value);
  }
}
