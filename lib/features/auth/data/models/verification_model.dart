import 'package:seed_app/features/auth/domain/entity/verification.dart';

class VerificationModel extends Verification {
  VerificationModel({required super.verificationCode});
  Map<String, dynamic> toJson() {
    return {'code': verificationCode};
  }

  factory VerificationModel.fromEnity(Verification verification) {
    return VerificationModel(
      verificationCode: verification.verificationCode,
    );
  }
}
