import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

import '../../../domain/models/app_user.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../widgets/dialog/confirm_remove_account_dialog.dart';
import '../../widgets/dialog/confirm_signout_dialog.dart';

part 'widgets/danger_area.dart';
part 'widgets/edit_profile_button.dart';
part 'widgets/no_user_found.dart';
part 'widgets/user_image.dart';
part 'widgets/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoggedOutState) {
          return const NoUserFound();
        } else if (state is AuthLoggedInState) {
          context.read<ProfileBloc>().add(ProfileGetUserInfo(userId: state.user.id));
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccessState) {
                final user = state.user;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UserImage(user: user),
                            const EditProfileButton(),
                          ],
                        ),
                      ),
                      UserInfo(user: user),
                      DangerArea(userId: user.id)
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
