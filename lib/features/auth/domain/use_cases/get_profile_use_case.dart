import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class GetProfileUseCase {
  final AuthRepository _authRepository;
  GetProfileUseCase(this._authRepository);

  Future<Either<Failure, User>> call() async {
    return await _authRepository.getProfile();
  }
}
