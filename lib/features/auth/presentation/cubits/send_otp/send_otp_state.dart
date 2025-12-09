part of 'send_otp_cubit.dart';

sealed class SendOtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SendOtpInitial extends SendOtpState {}

final class SendOtpLoading extends SendOtpState {}

final class SendOtpSucess extends SendOtpState {}

final class SendOtpFailure extends SendOtpState {
  final String message;

  SendOtpFailure(this.message);

  @override
  List<Object?> get props => [message];
}
