import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/email_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/password_input.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/inputs/username_input.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<SignupNameChanged>(_onNameChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupConfirmPasswordChanged>(_onConfirmPasswordChanged);
  }

  void _onEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    final email = EmailInput.dirty(value: event.email);

    emit(
      state.copyWith(
          email: email,
          status: Formz.validate([email, state.password, state.name, state.confirmPassword]),),
    );
  }

  void _onPasswordChanged(SignupPasswordChanged event, Emitter<SignupState> emit) {
    final password = PasswordInput.dirty(value: event.password);

    emit(
      state.copyWith(
          password: password,
          status: Formz.validate([password, state.email, state.name, state.confirmPassword]),),
    );
  }

  void _onConfirmPasswordChanged(SignupConfirmPasswordChanged event, Emitter<SignupState> emit) {
    final password = PasswordInput.dirty(value: event.password);

    emit(
      state.copyWith(
          confirmPassword: password,
          status: Formz.validate([password, state.email, state.name, state.password]),),
    );
  }

  void _onNameChanged(SignupNameChanged event, Emitter<SignupState> emit) {
    final name = NameInput.dirty(value: event.name);

    emit(
      state.copyWith(
          name: name,
          status: Formz.validate([name, state.email, state.password, state.confirmPassword]),),
    );
  }
}
