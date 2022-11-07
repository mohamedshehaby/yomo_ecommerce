import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/widgets/order_summary.dart';

import '../../../app/functions.dart';
import '../../../domain/models/user_order.dart';

part 'widgets/delivery_info.dart';
part 'widgets/order_items.dart';
part 'widgets/order_status.dart';

class OrderDetails extends StatelessWidget {
  final UserOrder order;
  const OrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(AppStrings.orderDetails),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              OrderStatus(
                order: order,
              ),
              DeliveryInfo(order: order),
              OrderSummary(subTotal: order.subTotal, deliverFee: order.deliveryFee),
              OrderItems(order: order)
            ],
          ),
        ),
      ),
    );
  }
}
