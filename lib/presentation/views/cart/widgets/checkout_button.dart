part of '../cart_view.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36),
      child: ElevatedButton(
        onPressed: () async {
          final user = context.read<AuthBloc>().state.user;
          if (user == null) {
            final answer = await showSignInDialog(context: context);
            if (answer == false || answer == null) {
              return;
            } else {
              _goToLoginView(context);
            }
          } else {
            context.read<CartBloc>().add(CartUploaded(userId: user.id));
            _goToCheckoutView(context);
          }
        },
        child: const Text(AppStrings.checkout),
      ),
    );
  }

  _goToLoginView(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  _goToCheckoutView(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.checkoutRoute);
  }
}
