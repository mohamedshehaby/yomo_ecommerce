part of '../orders_view.dart';

class OrdersList extends StatelessWidget {
  final List<UserOrder> orders;
  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, i) {
        return Card(
          shadowColor: ColorManager.primary.withAlpha(80),
          elevation: 2,
          child: ListTile(
            title: Text('Order#: ${orders[i].id.substring(1, 8)}'),
            subtitle: Text((DateFormat.yMd().add_jms().format(orders[i].createdAt))),
            trailing: Text(
              orders[i].status,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: mapStatusToColor(orders[i].status)),
            ),
          ),
        );
      },
    );
  }

  Color mapStatusToColor(String status) {
    if (status == 'pending') {
      return ColorManager.primary;
    } else if (status == 'confirmed') {
      return Colors.yellow;
    } else if (status == 'in progress') {
      return Colors.deepOrange;
    } else if (status == 'delivered') {
      return Colors.green;
    }
    return Colors.grey;
  }
}
