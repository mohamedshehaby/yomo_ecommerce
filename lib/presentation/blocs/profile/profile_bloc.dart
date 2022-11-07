import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';

import '../../../domain/repository/repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  Repository repository;
  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<ProfileGetUserInfo>(_onGetUserInfo);
  }

  _onGetUserInfo(ProfileGetUserInfo event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    (await repository.getUser(event.userId)).fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (user) => emit(ProfileSuccessState(user: user)),
    );
  }
}
