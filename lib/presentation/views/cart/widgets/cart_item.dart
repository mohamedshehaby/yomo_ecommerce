part of '../cart_view.dart';

class CartItem extends StatelessWidget {
  final CartSuccessState state;
  final int index;

  const CartItem({
    super.key,
    required this.state,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cartItem = state.cart.items[index];
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: AppFlex.f1,
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p18),
              width: AppSize.s80,
              height: AppSize.s80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: ColorManager.lightPrimary,
                  style: BorderStyle.solid,
                  width: AppSize.s1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s10),
                image: DecorationImage(
                  image: NetworkImage(cartItem.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s4,
          ),
          Expanded(
            flex: AppFlex.f3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.cart.items[index].name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  state.cart.items[index].category,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: AppFlex.f3,
                      child: Text(
                        '\$${cartItem.price * cartItem.quantity}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    (cartItem.maxQuantity == cartItem.quantity)
                        ? const Expanded(
                            flex: AppFlex.f2,
                            child: ElevatedButton(
                              onPressed: null,
                              child: Icon(Icons.add),
                            ),
                          )
                        : Expanded(
                            flex: AppFlex.f2,
                            child: ElevatedButton(
                              onPressed: () => context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(cartItem: cartItem)),
                              child: const Icon(Icons.add),
                            ),
                          ),
                    Expanded(
                      flex: AppFlex.f3,
                      child: Text(
                        cartItem.quantity.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: AppFlex.f2,
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<CartBloc>().add(CartProductRemoved(cartItem: cartItem)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
