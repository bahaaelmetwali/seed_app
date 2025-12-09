import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/api_service.dart';
import 'package:seed_app/features/auth/data/models/auth_response_model.dart';
import 'package:seed_app/features/auth/data/models/send_request_model.dart';
import 'package:seed_app/features/auth/data/models/verification_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(
    SendMobileRequestModel sendMobileRequestModel,
  );
  Future<Unit> sendOtp(VerificationModel verificationModel);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;
  AuthRemoteDataSourceImpl(this._apiService);
  @override
  Future<AuthResponseModel> login(
    SendMobileRequestModel sendMobileRequestModel,
  ) async {
    final response = await _apiService.post(
      endPoint: 'auth/login',
      data: sendMobileRequestModel.toJson(),
    );
    final AuthResponseModel authResponseModel = AuthResponseModel.fromJson(
      response['data'],
    );
    return authResponseModel;
  }

  @override
  Future<Unit> sendOtp(VerificationModel verificationModel) async {
    // ignore: unused_local_variable
    final response = await _apiService.post(
      endPoint: 'auth/verify-otp',
      data: verificationModel.toJson(),
    );
    return Future.value(unit);
  }
}
