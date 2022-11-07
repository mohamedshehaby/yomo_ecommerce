part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final AppUser user;

  const ProfileSuccessState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class ProfileFailureState extends ProfileState {
  final Failure failure;

  const ProfileFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
