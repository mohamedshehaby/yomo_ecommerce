import 'package:formz/formz.dart';

enum ZipcodeInputError { empty }

class ZipcodeInput extends FormzInput<String, ZipcodeInputError> {
  const ZipcodeInput.pure() : super.pure('');

  const ZipcodeInput.dirty({String value = ''}) : super.dirty(value);

  @override
  ZipcodeInputError? validator(String value) {
    return value.length >= 4 ? null : ZipcodeInputError.empty;
  }
}
