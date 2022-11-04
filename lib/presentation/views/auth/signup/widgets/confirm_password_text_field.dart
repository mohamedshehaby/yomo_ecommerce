part of '../signup_view.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (password) =>
                context.read<SignupBloc>().add(SignupConfirmPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppStrings.confirmPassword,
              errorText: ((state.confirmPassword.status == FormzInputStatus.valid ||
                          state.confirmPassword.status == FormzInputStatus.pure)) &&
                      state.password.value == state.confirmPassword.value
                  ? null
                  : AppStrings.confirmPasswordError,
            ),
          ),
        );
      },
    );
  }
}
