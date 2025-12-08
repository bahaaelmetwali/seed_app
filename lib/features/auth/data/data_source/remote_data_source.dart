import 'package:dartz/dartz.dart';
import 'package:seed_app/features/auth/data/models/user_model.dart';
import 'package:seed_app/features/auth/data/models/verification_model.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> login(UserModel user);
  Future<Unit> sendOtp(VerificationModel verificationModel);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Unit> login(UserModel user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Unit> sendOtp(VerificationModel verificationModel) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }
}