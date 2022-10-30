import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yomo_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccessState) {
          final cart = state.cart;
          if (cart.items.isEmpty) {
            return _buildEmptyCart(context);
          } else {
            return Column(
              children: [
                Expanded(
                  flex: AppFlex.f5,
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return _buildCartItemWidget(state, context, index);
                    },
                  ),
                ),
                Expanded(
                  flex: AppFlex.f2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildCartPriceInfo(context, state.cart.subTotal, AppStrings.subtotal),
                        _buildCartPriceInfo(context, cart.deliverFee, AppStrings.shipping),
                        _buildCartPriceInfo(
                          context,
                          (cart.subTotal + cart.deliverFee),
                          AppStrings.total,
                        ),
                        _buildCheckoutButton()
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }
        return Lottie.asset(JsonAssets.loading);
      },
    );
  }

  /// [_buildEmptyCart] to show when no items in cart
  Widget _buildEmptyCart(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Lottie.asset(JsonAssets.emptyCart),
          Text(
            AppStrings.emptyCart,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManager.darkPrimary),
          )
        ],
      ),
    );
  }

  /// [_buildCartItemWidget] to build the cart item
  Padding _buildCartItemWidget(CartSuccessState state, BuildContext context, int index) {
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
                    Expanded(
                      flex: AppFlex.f2,
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<CartBloc>().add(CartProductAdded(cartItem: cartItem)),
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

  /// [_buildCartPriceInfo] to build the price of subtotal,total,shipping
  Padding _buildCartPriceInfo(BuildContext context, double price, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorManager.grey),
          ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }

  /// [_buildCheckoutButton] to show checkout button
  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36),
      child: ElevatedButton(onPressed: () {}, child: const Text(AppStrings.checkout)),
    );
  }
}
