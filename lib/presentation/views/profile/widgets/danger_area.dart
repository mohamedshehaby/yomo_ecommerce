part of '../profile_view.dart';

class DangerArea extends StatelessWidget {
  final String userId;
  const DangerArea({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p8),
          child: Text(
            'Danger Area',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p60),
          child: ElevatedButton(
            onPressed: () async {
              final result = await showConfirmSignOutDialog(context: context);
              if (result == false || result == null) return;
              context.read<AuthBloc>().add(AuthLogoutEvent());
            },
            child: const Text('Sign out'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p60),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                final result = await showConfirmRemoveAccountDialog(context: context);
                if (result == false || result == null) return;
                context.read<AuthBloc>().add(AuthRemoveAccountEvent(userId: userId));
              },
              child: const Text('Remove Account')),
        ),
      ],
    );
  }
}
