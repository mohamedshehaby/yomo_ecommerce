import 'package:formz/formz.dart';

enum GovernorateInputError { empty }

class GovernorateInput extends FormzInput<String, GovernorateInputError> {
  const GovernorateInput.pure() : super.pure('');

  const GovernorateInput.dirty({String value = ''}) : super.dirty(value);

  @override
  GovernorateInputError? validator(String value) {
    return value.length >= 4 ? null : GovernorateInputError.empty;
  }
}
