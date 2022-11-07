part of '../orders_view.dart';

class OrdersList extends StatelessWidget {
  final List<UserOrder> orders;
  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(Routes.orderDetailsRoute, arguments: orders[i]),
          child: Card(
            shadowColor: ColorManager.primary.withAlpha(80),
            elevation: 2,
            child: ListTile(
              title: Text('Order#: ${orders[i].id.substring(1, 8)}'),
              subtitle: Text((DateFormat.yMd().add_jms().format(orders[i].createdAt))),
              trailing: Text(
                orders[i].status.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: mapStatusToColor(orders[i].status)),
              ),
            ),
          ),
        );
      },
    );
  }
}
