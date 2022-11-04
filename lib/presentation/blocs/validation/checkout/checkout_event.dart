part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

class CheckoutAddressChanged extends CheckoutEvent {
  final String address;

  const CheckoutAddressChanged({
    required this.address,
  });

  @override
  List<Object> get props => [address];
}

class CheckoutGovernorateChanged extends CheckoutEvent {
  final String governorate;

  const CheckoutGovernorateChanged({
    required this.governorate,
  });

  @override
  List<Object> get props => [governorate];
}

class CheckoutCityChanged extends CheckoutEvent {
  final String city;

  const CheckoutCityChanged({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}

class CheckoutZipcodeChanged extends CheckoutEvent {
  final int zipcode;

  const CheckoutZipcodeChanged({
    required this.zipcode,
  });

  @override
  List<Object> get props => [zipcode];
}

class CheckoutPhoneChanged extends CheckoutEvent {
  final String phone;

  const CheckoutPhoneChanged({
    required this.phone,
  });

  @override
  List<Object> get props => [phone];
}

class CheckoutPaymentChanged extends CheckoutEvent {
  final Payment paymentOption;

  const CheckoutPaymentChanged({
    required this.paymentOption,
  });

  @override
  List<Object> get props => [paymentOption];
}
