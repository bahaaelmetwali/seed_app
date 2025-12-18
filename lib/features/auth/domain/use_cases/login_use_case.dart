import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/auth/domain/entity/send_request.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<Either<Failure, Unit>> call(SendRequest sendRequest) async {
    return await _authRepository.login(sendRequest);
  }
}
