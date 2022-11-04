import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/routes_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoggedOutState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign in to view profile'),
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
                child: const Text('Sign in'),
              )
            ],
          );
        }
        return Center(
          child: ElevatedButton(
            onPressed: () => context.read<AuthBloc>().add(AuthLogoutEvent()),
            child: const Text('Logout'),
          ),
        );
      },
    );
  }
}
