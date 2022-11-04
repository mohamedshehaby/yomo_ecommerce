import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Repository repository;

  AuthBloc({required this.repository}) : super(AuthLoggedOutState()) {
    on<AuthStarted>(_onStarted);
    on<AuthSignupEvent>(_onSignup);
    on<AuthLoginEvent>(_onLoggIn);
    on<AuthLogoutEvent>(_onLogout);
  }

  _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    (await repository.getUserLocally()).fold((_) {
      emit(AuthLoggedOutState());
    }, (appUser) {
      emit(AuthLoggedInState(user: appUser));
    });
  }

  _onSignup(AuthSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    (await repository.signup(event.email, event.password, event.name)).fold((failure) {
      emit(AuthFailureState(failure: failure));
    }, (user) {
      emit(AuthLoggedInState(user: user));
    });
  }

  _onLoggIn(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    (await repository.login(event.email, event.password)).fold((failure) {
      emit(AuthFailureState(failure: failure));
    }, (user) {
      emit(AuthLoggedInState(user: user));
    });
  }

  _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    (await repository.logout()).fold((failure) {
      emit(AuthFailureState(failure: failure));
    }, (_) {
      emit(AuthLoggedOutState());
    });
  }
}
