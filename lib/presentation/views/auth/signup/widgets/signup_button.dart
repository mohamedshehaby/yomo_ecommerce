part of '../signup_view.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: ElevatedButton(
            onPressed: state.status.isValidated
                ? () {
                    context.read<AuthBloc>().add(
                          AuthSignupEvent(
                            email: state.email.value,
                            password: state.password.value,
                            name: state.name.value,
                          ),
                        );
                  }
                : null,
            child: const Text(AppStrings.signup),
          ),
        );
      },
    );
  }
}
