import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/login/login_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/auth_logo.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/skip_button.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/show_auth_error.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/loading_screen/loading_screen.dart';

part 'widgets/email_text_field.dart';
part 'widgets/go_to_signup_view_button.dart';
part 'widgets/login_button.dart';
part 'widgets/password_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [SkipButton()],
          scrolledUnderElevation: AppSize.s0,
          elevation: AppSize.s0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              LoadingScreen.instance().show(context: context, text: AppStrings.loggingYou);
            } else {
              LoadingScreen.instance().hide();
              if (state is AuthFailureState) {
                showAuthFailureDialog(context: context, authFailure: state.failure);
              }
              if (state is AuthLoggedInState) {
                Navigator.pushNamedAndRemoveUntil(context, Routes.mainRoute, (_) => false);
              }
            }
          },
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AuthLogo(),
                  EmailTextField(),
                  PasswordTextField(),
                  LoginButton(),
                  GoToSignupViewButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
