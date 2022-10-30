part of 'login_bloc.dart';

class LoginState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormzStatus status;

  const LoginState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.status = FormzStatus.pure,
  });

  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    PasswordInput? confirmPassword,
    FormzStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
