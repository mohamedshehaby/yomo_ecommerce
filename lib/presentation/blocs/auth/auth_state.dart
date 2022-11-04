part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoggedInState extends AuthState {
  final AppUser user;

  const AuthLoggedInState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class AuthLoggedOutState extends AuthState {}

class AuthFailureState extends AuthState {
  final Failure failure;

  const AuthFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

extension User on AuthState {
  AppUser? get user {
    final cs = this;
    if (cs is AuthLoggedInState) {
      return cs.user;
    } else {
      return null;
    }
  }
}
