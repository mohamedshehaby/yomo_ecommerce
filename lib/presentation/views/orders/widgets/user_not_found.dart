part of '../orders_view.dart';

class UserNotFound extends StatelessWidget {
  const UserNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.loginToViewOrders),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
          child: const Text(AppStrings.login),
        )
      ],
    );
  }
}
