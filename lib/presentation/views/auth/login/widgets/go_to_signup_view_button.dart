part of '../login_view.dart';

class GoToSignupViewButton extends StatelessWidget {
  const GoToSignupViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.signupRoute);
      },
      child: const Text(
        AppStrings.createNewAccount,
      ),
    );
  }
}
