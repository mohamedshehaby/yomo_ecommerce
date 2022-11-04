part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  final AddressInput address;
  final CityInput city;
  final GovernorateInput governorate;
  final PhoneInput phone;
  final ZipcodeInput zipcode;
  final Payment paymentOption;
  final FormzStatus status;

  const CheckoutState({
    this.address = const AddressInput.pure(),
    this.city = const CityInput.pure(),
    this.governorate = const GovernorateInput.pure(),
    this.phone = const PhoneInput.pure(),
    this.zipcode = const ZipcodeInput.pure(),
    this.paymentOption = Payment.cash,
    this.status = FormzStatus.pure,
  });

  CheckoutState copyWith({
    AddressInput? address,
    CityInput? city,
    GovernorateInput? governorate,
    PhoneInput? phone,
    ZipcodeInput? zipcode,
    Payment? paymentOption,
    FormzStatus? status,
  }) {
    return CheckoutState(
      address: address ?? this.address,
      city: city ?? this.city,
      governorate: governorate ?? this.governorate,
      phone: phone ?? this.phone,
      zipcode: zipcode ?? this.zipcode,
      paymentOption: paymentOption ?? this.paymentOption,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [address, city, governorate, phone, zipcode, paymentOption, status];
}
