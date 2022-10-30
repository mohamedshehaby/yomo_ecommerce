part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final EmailInput email;
  final NameInput name;
  final PasswordInput password;
  final PasswordInput confirmPassword;

  final FormzStatus status;

  const SignupState({
    this.email = const EmailInput.pure(),
    this.name = const NameInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const PasswordInput.pure(),
    this.status = FormzStatus.pure,
  });

  SignupState copyWith({
    EmailInput? email,
    NameInput? name,
    PasswordInput? password,
    PasswordInput? confirmPassword,
    FormzStatus? status,
  }) {
    return SignupState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        email,
        name,
        password,
        confirmPassword,
        status,
      ];
}
