import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';

abstract class AuthRepository {
  Future<Either<Failure,Unit>> login(User user);
  Future<Either<Failure,Unit>> sendOtp(Verification verification);
}
