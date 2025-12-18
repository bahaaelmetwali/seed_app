import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/core/utils/error_handling/handle_request.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';
import 'package:seed_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:seed_app/features/auth/data/models/auth_response_model.dart';
import 'package:seed_app/features/auth/data/models/send_register_request_model.dart';
import 'package:seed_app/features/auth/data/models/send_request_model.dart';
import 'package:seed_app/features/auth/data/models/verification_model.dart';
import 'package:seed_app/features/auth/domain/entity/register_request.dart';
import 'package:seed_app/features/auth/domain/entity/send_request.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  final LocalDataSource _localDataSource;
  AuthRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, Unit>> login(SendRequest sendRequest) async {
    SendMobileRequestModel sendMobileRequestModel =
        SendMobileRequestModel.fromEnity(sendRequest);

    return handleRequest<Unit>(
      request: () async {
        AuthResponseModel authResponseModel = await _remoteDataSource.login(
          sendMobileRequestModel,
        );
        final String token = authResponseModel.accessToken;

        _localDataSource.cacheToken(token);
        _localDataSource.cacheUserType();
        return Future.value(unit);
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

  @override
  Future<Either<Failure, Unit>> register(RegisterRequest registerRequest) {
    SendRegisterRequestModel sendRegisterRequestModel =
        SendRegisterRequestModel.fromEnity(registerRequest);

    return handleRequest<Unit>(
      request: () async {
        AuthResponseModel authResponseModel = await _remoteDataSource.register(
          sendRegisterRequestModel,
        );
        final String token = authResponseModel.accessToken;
        _localDataSource.cacheToken(token);
        _localDataSource.cacheUserType();

        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resendOtp() {
    return handleRequest<Unit>(
      request: () async {
        await _remoteDataSource.resendotp();
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, User>> getProfile() {
    return handleRequest<User>(
      request: () async {
        final user = await _remoteDataSource.getProfile();
        final userAcount = user.toEntity();
        return userAcount;
      },
    );
  }
}
