import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class VerificationUseCase {
  final AuthRepository _authRepository;
  VerificationUseCase(this._authRepository);

  Future<Either<Failure, Unit>> call(Verification verification) async {
    return await _authRepository.sendOtp(verification);
  }
}
