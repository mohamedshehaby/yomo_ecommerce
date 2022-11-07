part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;

  final String password;

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthSignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const AuthSignupEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}

class AuthRemoveAccountEvent extends AuthEvent {
  final String userId;

  const AuthRemoveAccountEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class AuthLogoutEvent extends AuthEvent {}
