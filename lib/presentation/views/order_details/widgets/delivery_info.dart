part of '../order_details.dart';

class DeliveryInfo extends StatelessWidget {
  final UserOrder order;
  const DeliveryInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p8),
          child: Text(
            AppStrings.deliveryInfo,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        _buildInfoListTile(context, Icons.place, AppStrings.address, order.address),
        _buildInfoListTile(context, Icons.home, AppStrings.city, order.city),
        _buildInfoListTile(context, Icons.map_rounded, AppStrings.state, order.governorate),
        _buildInfoListTile(context, Icons.phone, AppStrings.phone, order.phone),
        _buildInfoListTile(context, Icons.numbers_sharp, AppStrings.zipcode, order.zipcode),
        _buildInfoListTile(context, Icons.money, AppStrings.paymentMethod, order.paymentOption),
      ],
    );
  }

  Widget _buildInfoListTile(BuildContext context, IconData icon, String title, String subtitle) {
    return Card(
      elevation: AppSize.s1,
      child: ListTile(
        leading: Icon(
          icon,
          color: ColorManager.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
