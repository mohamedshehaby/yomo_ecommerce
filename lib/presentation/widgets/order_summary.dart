import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/domain/models/cart.dart';
import 'package:yomo_ecommerce/presentation/resources/color_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

class OrderSummary extends StatelessWidget {
  final Cart cart;

  const OrderSummary({
    super.key,
    required this.cart,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
      child: Card(
        elevation: AppSize.s2,
        shadowColor: ColorManager.primary,
        child: Column(
          children: [
            _buildCartPriceInfo(context, cart.subTotal, AppStrings.subtotal),
            _buildCartPriceInfo(context, cart.deliverFee, AppStrings.shipping),
            _buildCartPriceInfo(
              context,
              (cart.subTotal + cart.deliverFee),
              AppStrings.total,
            ),
          ],
        ),
      ),
    );
  }

  /// [_buildCartPriceInfo] to build the price of subtotal,total,shipping
  Padding _buildCartPriceInfo(BuildContext context, double price, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4, horizontal: AppPadding.p36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
}
