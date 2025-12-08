import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<Either<Failure, Unit>> call(User user) async {
    return await _authRepository.login(user);
  }
}
