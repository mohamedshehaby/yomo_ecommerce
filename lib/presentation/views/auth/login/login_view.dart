import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/login/login_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/auth_logo.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/skip_button.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../widgets/dialog/show_auth_error.dart';
import '../../../widgets/loading/loading_screen/loading_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              LoadingScreen.instance().show(context: context, text: 'Logging you in ');
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
                children: [
                  const AuthLogo(),
                  _EmailTextField(),
                  _PasswordTextField(),
                  _LoginButton(),
                  const _GoToSignupViewButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => context.read<LoginBloc>().add(LoginEmailChanged(email)),
            decoration: InputDecoration(
              labelText: AppStrings.email,
              errorText: (state.email.status == FormzInputStatus.valid ||
                      state.email.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.emailError,
            ),
          ),
        );
      },
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppStrings.password,
              errorText: (state.password.status == FormzInputStatus.valid ||
                      state.password.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.passwordErrorSimple,
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: ElevatedButton(
            onPressed: state.status.isValidated
                ? () {
                    context.read<AuthBloc>().add(
                        AuthLoginEvent(email: state.email.value, password: state.password.value));
                  }
                : null,
            child: const Text(AppStrings.login),
          ),
        );
      },
    );
  }
}

class _GoToSignupViewButton extends StatelessWidget {
  const _GoToSignupViewButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.signupRoute);
      },
      child: const Text(
        AppStrings.createNewAccount,
      ),
    );
  }
}
