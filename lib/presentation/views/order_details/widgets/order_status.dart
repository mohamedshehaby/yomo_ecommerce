part of '../order_details.dart';

class OrderStatus extends StatelessWidget {
  final UserOrder order;
  const OrderStatus({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p8),
          child: Text(
            AppStrings.statusInfo,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              children: [
                Text(order.status.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: mapStatusToColor(order.status))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.createdAt, style: Theme.of(context).textTheme.labelLarge),
                        Text((DateFormat.yMd().add_jm().format(order.createdAt))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(AppStrings.confirmedAt, style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          (order.confirmedAt == null)
                              ? AppStrings.waiting
                              : (DateFormat.yMd().add_jm().format(order.confirmedAt!)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Excepted to be delivered',
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          (DateFormat.yMd().format(order.createdAt.add(const Duration(days: 3)))),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(AppStrings.deliveredAt, style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          (order.deliveredAt == null)
                              ? AppStrings.waiting
                              : (DateFormat.yMd().add_jm().format(order.deliveredAt!)),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
