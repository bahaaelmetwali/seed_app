import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/auth/domain/entity/send_request.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(SendRequest sendRequest);
  Future<Either<Failure, Unit>> sendOtp(Verification verification);
}
