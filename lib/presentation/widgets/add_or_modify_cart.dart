import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';

import 'package:yomo_ecommerce/domain/models/cart.dart';
import 'package:yomo_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

class AddOrModifyCart extends StatelessWidget {
  final Product product;
  const AddOrModifyCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccessState) {
          final cartItems = state.cart.items;
          var isItemInCart = cartItems.indexWhere((item) => product.id == item.id);

          if (isItemInCart != -1) {
            var cartItem = cartItems.firstWhere((item) => item.id == product.id);
            return _buildModifyCartSection(context, cartItem);
          }
        }
        if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return _buildAddToCartButton(context);
      },
    );
  }

  Row _buildModifyCartSection(BuildContext context, CartItem cartItem) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () => context.read<CartBloc>().add(CartProductAdded(cartItem: cartItem)),
            child: const Icon(Icons.add),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              const Text('In cart'),
              Text(
                cartItem.quantity.toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () => context.read<CartBloc>().add(CartProductRemoved(cartItem: cartItem)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Icon(Icons.remove),
          ),
        ),
      ],
    );
  }

  ElevatedButton _buildAddToCartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CartBloc>().add(CartProductAdded(cartItem: CartItem.fromProduct(product)));
      },
      child: const Text(AppStrings.addToCart),
    );
  }
}
