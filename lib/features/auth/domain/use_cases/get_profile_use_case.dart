import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/auth/domain/entity/send_request.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class GetProfileUseCase {
  final AuthRepository _authRepository;
  GetProfileUseCase(this._authRepository);

  Future<Either<Failure, User>> call(SendRequest sendRequest) async {
    return await _authRepository.getProfile();
  }
}
