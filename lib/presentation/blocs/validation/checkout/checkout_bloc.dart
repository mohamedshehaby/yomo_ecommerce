import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/adress_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/city_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/phone_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/state_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/zipcode_input.dart';

import 'package:yomo_ecommerce/app/enums.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const CheckoutState()) {
    on<CheckoutAddressChanged>(_onAddressChanged);
    on<CheckoutCityChanged>(_onCityChanged);
    on<CheckoutGovernorateChanged>(_onGovernorateChanged);
    on<CheckoutZipcodeChanged>(_onZipcodeChanged);
    on<CheckoutPhoneChanged>(_onPhoneChanged);
    on<CheckoutPaymentChanged>(_onPaymentChanged);
  }

  _onAddressChanged(CheckoutAddressChanged event, Emitter<CheckoutState> emit) {
    final address = AddressInput.dirty(value: event.address);

    emit(
      state.copyWith(
        address: address,
        status:
            Formz.validate([address, state.city, state.governorate, state.zipcode, state.phone]),
      ),
    );
  }

  _onCityChanged(CheckoutCityChanged event, Emitter<CheckoutState> emit) {
    final city = CityInput.dirty(value: event.city);

    emit(
      state.copyWith(
        city: city,
        status:
            Formz.validate([city, state.address, state.governorate, state.zipcode, state.phone]),
      ),
    );
  }

  _onGovernorateChanged(CheckoutGovernorateChanged event, Emitter<CheckoutState> emit) {
    final governorate = GovernorateInput.dirty(value: event.governorate);

    emit(
      state.copyWith(
        governorate: governorate,
        status:
            Formz.validate([governorate, state.address, state.city, state.zipcode, state.phone]),
      ),
    );
  }

  _onZipcodeChanged(CheckoutZipcodeChanged event, Emitter<CheckoutState> emit) {
    final zipcode = ZipcodeInput.dirty(value: event.zipcode.toString());

    emit(
      state.copyWith(
        zipcode: zipcode,
        status:
            Formz.validate([zipcode, state.address, state.city, state.governorate, state.phone]),
      ),
    );
  }

  _onPhoneChanged(CheckoutPhoneChanged event, Emitter<CheckoutState> emit) {
    final phone = PhoneInput.dirty(value: event.phone.toString());

    emit(
      state.copyWith(
        phone: phone,
        status:
            Formz.validate([phone, state.address, state.city, state.governorate, state.zipcode]),
      ),
    );
  }

  _onPaymentChanged(CheckoutPaymentChanged event, Emitter<CheckoutState> emit) {
    emit(state.copyWith(paymentOption: event.paymentOption));
  }
}
