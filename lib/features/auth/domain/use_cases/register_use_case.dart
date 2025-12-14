import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/auth/domain/entity/register_request.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class RegisterUseCase {
    final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);

  Future<Either<Failure, Unit>> call(RegisterRequest registerRequest) async {
    return await _authRepository.register(registerRequest);
  }
}