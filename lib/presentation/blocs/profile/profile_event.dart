part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileGetUserInfo extends ProfileEvent {
  final String userId;

  const ProfileGetUserInfo({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
