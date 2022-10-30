import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/email_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/password_input.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = EmailInput.dirty(value: event.email);

    emit(
      state.copyWith(email: email, status: Formz.validate([email, state.password])),
    );
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = PasswordInput.dirty(value: event.password);

    emit(
      state.copyWith(password: password, status: Formz.validate([password, state.email])),
    );
  }
}
