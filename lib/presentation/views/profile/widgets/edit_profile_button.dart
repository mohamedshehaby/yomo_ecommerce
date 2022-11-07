part of '../profile_view.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s40,
      width: AppSize.s100,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        label: const Text('Edit'),
      ),
    );
  }
}
