import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/auth/domain/use_cases/resend_otp_use_case.dart';

part 'resend_otp_state.dart';


class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpUseCase resendOtpUseCase;

  ResendOtpCubit(this.resendOtpUseCase) : super(ResendOtpInitial());

  Future<void> resendOtp() async {
    emit(ResendOtpLoading());

    final result = await resendOtpUseCase();

    result.fold(
      (failure) => emit(
        ResendOtpFailure((failure.toString())),
      ),
      (_) => emit(ResendOtpSuccess()),
    );
  }

 
}