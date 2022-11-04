part of '../checkout_view.dart';

class GovernorateTextField extends StatelessWidget {
  const GovernorateTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      buildWhen: (previous, current) => previous.governorate != current.governorate,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (governorate) => context
                .read<CheckoutBloc>()
                .add(CheckoutGovernorateChanged(governorate: governorate)),
            decoration: InputDecoration(
              labelText: AppStrings.state,
              errorText: (state.governorate.status == FormzInputStatus.valid ||
                  state.governorate.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.stateError,
            ),
          ),
        );
      },
    );
  }
}