part of '../signup_view.dart';

class EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => context.read<SignupBloc>().add(SignupEmailChanged(email)),
            decoration: InputDecoration(
              labelText: AppStrings.email,
              errorText: (state.email.status == FormzInputStatus.valid ||
                      state.email.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.emailError,
            ),
          ),
        );
      },
    );
  }
}
