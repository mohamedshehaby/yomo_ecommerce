import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/signup/signup_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/auth_logo.dart';
import 'package:yomo_ecommerce/presentation/views/auth/widgets/skip_button.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/loading_screen/loading_screen.dart';

import 'package:yomo_ecommerce/presentation/widgets/dialog/show_auth_error.dart';

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
                  _NameTextField(),
                  _EmailTextField(),
                  _PasswordTextField(),
                  _ConfirmPasswordTextField(),
                  _SignupButton(),
                  const _GoToLoginViewButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NameTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (name) => context.read<SignupBloc>().add(SignupNameChanged(name)),
            decoration: InputDecoration(
              labelText: AppStrings.name,
              errorText: (state.name.status == FormzInputStatus.valid ||
                      state.name.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.nameError,
            ),
          ),
        );
      },
    );
  }
}

class _EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => context.read<SignupBloc>().add(SignupEmailChanged(email)),
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
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (password) =>
                context.read<SignupBloc>().add(SignupPasswordChanged(password)),
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

class _ConfirmPasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (password) =>
                context.read<SignupBloc>().add(SignupConfirmPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppStrings.confirmPassword,
              errorText: ((state.confirmPassword.status == FormzInputStatus.valid ||
                          state.confirmPassword.status == FormzInputStatus.pure)) &&
                      state.password.value == state.confirmPassword.value
                  ? null
                  : AppStrings.confirmPasswordError,
            ),
          ),
        );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: ElevatedButton(
            onPressed: state.status.isValidated
                ? () {
                    context.read<AuthBloc>().add(AuthSignupEvent(
                        email: state.email.value,
                        password: state.password.value,
                        name: state.name.value,),);
                  }
                : null,
            child: const Text(AppStrings.signup),
          ),
        );
      },
    );
  }
}

class _GoToLoginViewButton extends StatelessWidget {
  const _GoToLoginViewButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text(
        AppStrings.alreadyHaveAccount,
      ),
    );
  }
}
