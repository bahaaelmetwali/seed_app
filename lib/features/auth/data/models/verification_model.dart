import 'package:seed_app/features/auth/domain/entity/verification.dart';

class VerificationModel extends Verification {
  VerificationModel(super.phone, {required super.verificationCode});
  Map<String, dynamic> toJson() {
    return {'code': verificationCode};
  }

  factory VerificationModel.fromEnity(Verification verification) {
    return VerificationModel(
      verification.phone,
      verificationCode: verification.verificationCode,
    );
  }
}
