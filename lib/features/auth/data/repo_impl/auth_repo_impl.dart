import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/core/utils/handle_request.dart';
import 'package:seed_app/features/auth/data/data_source/remote_data_source.dart';
import 'package:seed_app/features/auth/data/models/user_model.dart';
import 'package:seed_app/features/auth/data/models/verification_model.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Unit>> login(User user) async {
    UserModel userModel = UserModel.fromEnity(user);

    return handleRequest<Unit>(
      request: () async {
        return await _remoteDataSource.login(userModel);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> sendOtp(Verification verification) {
    VerificationModel verificationModel = VerificationModel.fromEnity(
      verification,
    );
    return handleRequest<Unit>(
      request: () async {
        return await _remoteDataSource.sendOtp(verificationModel);
      },
    );
  }
}
