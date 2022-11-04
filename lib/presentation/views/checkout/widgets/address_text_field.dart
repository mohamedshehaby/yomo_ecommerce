
part of '../checkout_view.dart';
class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            keyboardType: TextInputType.streetAddress,
            onChanged: (address) =>
                context.read<CheckoutBloc>().add(CheckoutAddressChanged(address: address)),
            decoration: InputDecoration(
              labelText: AppStrings.address,
              errorText: (state.address.status == FormzInputStatus.valid ||
                  state.address.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.addressError,
            ),
          ),
        );
      },
    );
  }
}