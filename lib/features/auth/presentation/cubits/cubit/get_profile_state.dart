part of 'get_profile_cubit.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object?> get props => [];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final User user;

  const GetProfileSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class GetProfileFailure extends GetProfileState {
  final String message;

  const GetProfileFailure(this.message);

  @override
  List<Object?> get props => [message];
}
