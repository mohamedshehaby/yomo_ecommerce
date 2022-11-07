import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/color_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

class OrderSummary extends StatelessWidget {
  final double subTotal;
  final double deliverFee;

  const OrderSummary({
    super.key,
    required this.subTotal,
    required this.deliverFee,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p8),
          child: Text(
            AppStrings.orderSummary,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Card(
          elevation: AppSize.s1,
          shadowColor: ColorManager.primary,
          child: Column(
            children: [
              _buildCartPriceInfo(context, subTotal, AppStrings.subtotal),
              _buildCartPriceInfo(context, deliverFee, AppStrings.shipping),
              _buildCartPriceInfo(context, (subTotal + deliverFee), AppStrings.total),
            ],
          ),
        ),
      ],
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
