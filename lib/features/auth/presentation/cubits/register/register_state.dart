part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegistrLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMessage;
  const RegisterFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class RegisterSucess extends RegisterState {}
