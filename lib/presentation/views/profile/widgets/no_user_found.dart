part of '../profile_view.dart';

class NoUserFound extends StatelessWidget {
  const NoUserFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Sign in to view profile'),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
          child: const Text('Sign in'),
        )
      ],
    );
    ;
  }
}
