import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/app/functions.dart';

enum EmailInputError { empty }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    return (validateEmail(value, emailRegex) == true) ? null : EmailInputError.empty;
  }
}
