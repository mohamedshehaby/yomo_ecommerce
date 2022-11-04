part of '../checkout_view.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (phone) =>
                context.read<CheckoutBloc>().add(CheckoutPhoneChanged(phone: phone)),
            decoration: InputDecoration(
              labelText: AppStrings.phone,
              errorText: (state.phone.status == FormzInputStatus.valid ||
                      state.phone.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.phoneError,
            ),
          ),
        );
      },
    );
  }
}
