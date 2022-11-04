import 'package:formz/formz.dart';

enum AddressInputError { empty }

class AddressInput extends FormzInput<String, AddressInputError> {
  const AddressInput.pure() : super.pure('');

  const AddressInput.dirty({String value = ''}) : super.dirty(value);

  @override
  AddressInputError? validator(String value) {
    return value.length >= 10 ? null : AddressInputError.empty;
  }
}
