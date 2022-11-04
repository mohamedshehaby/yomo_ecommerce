import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yomo_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/widgets/order_summary.dart';

import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/show_signin_dialog.dart';

part 'widgets/cart_item.dart';
part 'widgets/checkout_button.dart';
part 'widgets/empty_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccessState) {
          final cart = state.cart;
          if (cart.items.isEmpty) {
            return const EmptyCart();
          } else {
            return Column(
              children: [
                Expanded(
                  flex: AppFlex.f5,
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return CartItem(state: state, index: index);
                    },
                  ),
                ),
                Expanded(
                  flex: AppFlex.f2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        OrderSummary(cart: cart),
                        const CheckoutButton(),
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
}
