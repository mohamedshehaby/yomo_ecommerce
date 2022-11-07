part of '../profile_view.dart';

class UserImage extends StatelessWidget {
  final AppUser user;
  const UserImage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: AppPadding.p12),
            child: CircleAvatar(
              radius: AppSize.s35,
              backgroundImage: (user.imageUrl == null) ? null : NetworkImage(user.imageUrl!),
            )),
        Column(
          children: [
            Text(
              user.name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              '@${user.name.split(' ').join().toLowerCase()}',
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ],
    );
  }
}
