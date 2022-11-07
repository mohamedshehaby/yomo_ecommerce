part of '../profile_view.dart';

class UserInfo extends StatelessWidget {
  final AppUser user;
  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p8),
          child: Text(
            '${user.name.split(' ').first}\'s Info',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        _buildInfoListTile(context, Icons.email, AppStrings.email, user.email),
        _buildInfoListTile(context, Icons.map, AppStrings.address, user.address ?? ''),
        _buildInfoListTile(context, Icons.phone, AppStrings.phone, user.phone ?? ''),
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
