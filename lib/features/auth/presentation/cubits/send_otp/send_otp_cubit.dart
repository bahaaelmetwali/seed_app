import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';
import 'package:seed_app/features/auth/domain/use_cases/verification_use_case.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final VerificationUseCase _verificationUseCase;

  SendOtpCubit(this._verificationUseCase) : super(SendOtpInitial());
  Future<void> sendOtp(Verification verification) async {
    emit(SendOtpLoading());

    final result = await _verificationUseCase(verification);

    result.fold(
      (failure) => emit(SendOtpFailure(failure.toString())),
      (unit) => emit(SendOtpSucess()),
    );
  }
}
