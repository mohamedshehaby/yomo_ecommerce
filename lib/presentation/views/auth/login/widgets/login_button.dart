part of '../login_view.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: ElevatedButton(
            onPressed: state.status.isValidated
                ? () {
                    context.read<AuthBloc>().add(
                          AuthLoginEvent(email: state.email.value, password: state.password.value),
                        );
                  }
                : null,
            child: const Text(AppStrings.login),
          ),
        );
      },
    );
  }
}
