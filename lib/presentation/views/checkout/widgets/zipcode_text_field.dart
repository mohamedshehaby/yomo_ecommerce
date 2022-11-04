part of '../checkout_view.dart';

class ZipcodeTextField extends StatelessWidget {
  const ZipcodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      buildWhen: (previous, current) => previous.zipcode != current.zipcode,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (zipcode) => context
                .read<CheckoutBloc>()
                .add(CheckoutZipcodeChanged(zipcode: int.parse(zipcode))),
            decoration: InputDecoration(
              labelText: AppStrings.zipcode,
              errorText: (state.zipcode.status == FormzInputStatus.valid ||
                      state.zipcode.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.zipcodeError,
            ),
          ),
        );
      },
    );
  }
}
