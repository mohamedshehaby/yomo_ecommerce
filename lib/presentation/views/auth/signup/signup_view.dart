import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/signup/signup_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/auth_logo.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/skip_button.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/show_auth_error.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/loading_screen/loading_screen.dart';

part 'widgets/confirm_password_text_field.dart';
part 'widgets/email_text_field.dart';
part 'widgets/go_to_login_view_button.dart';
part 'widgets/name_text_field.dart';
part 'widgets/password_text_field.dart';
part 'widgets/signup_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [SkipButton()],
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              LoadingScreen.instance().show(context: context, text: 'Creating your account');
            } else {
              LoadingScreen.instance().hide();
              if (state is AuthFailureState) {
                showAuthFailureDialog(context: context, authFailure: state.failure);
              }
            }
          },
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthLogo(),
                  const NameTextField(),
                  EmailTextField(),
                  const PasswordTextField(),
                  const ConfirmPasswordTextField(),
                  const SignupButton(),
                  const GoToLoginViewButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
