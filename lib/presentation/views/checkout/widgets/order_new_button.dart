
part of '../checkout_view.dart';

class OrderNowButton extends StatelessWidget {
  const OrderNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: ElevatedButton(
            onPressed: state.status.isValidated ? () => uploadOrder(context, state) : null,
            child: const Text(AppStrings.orderNow),
          ),
        );
      },
    );
  }
  uploadOrder(BuildContext context, CheckoutState state) {
    final cart = context.read<CartBloc>().state.cart;
    final checkout = context.read<CheckoutBloc>().state;
    final orderItems = cart!.items.map((item) => OrderItem.fromCartItem(item)).toList();
    final userId = context.read<AuthBloc>().state.user!.id;

    final order = UserOrder.init(
      items: orderItems,
      paymentOption: state.paymentOption == Payment.cash ? 'cash' : 'visa',
      total: (cart.subTotal + cart.deliverFee),
      subTotal: cart.subTotal,
      deliveryFee: cart.deliverFee,
      zipcode: checkout.zipcode.value,
      address: checkout.address.value,
      phone: checkout.phone.value,
      governorate: checkout.governorate.value,
      city: checkout.city.value,
    );
    context.read<OrderBloc>().add(OrderAdded(order: order, userId: userId));
  }

}


