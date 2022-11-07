part of '../order_details.dart';

class OrderItems extends StatelessWidget {
  final UserOrder order;
  const OrderItems({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p8),
          child: Text(
            AppStrings.orderItems,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Wrap(
          children: order.items
              .map((item) => Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                            height: AppSize.s100,
                            width: AppSize.s100,
                            child: Image.network(
                              item.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                    Text(item.category),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '\$${item.price * item.quantity}',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    Text('x${item.quantity.toString()}')
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
