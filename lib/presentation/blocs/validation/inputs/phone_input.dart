import 'package:formz/formz.dart';

enum PhoneInputError { empty }

class PhoneInput extends FormzInput<String, PhoneInputError> {
  const PhoneInput.pure() : super.pure('');

  const PhoneInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PhoneInputError? validator(String value) {
    return value.length == 11 ? null : PhoneInputError.empty;
  }
}
