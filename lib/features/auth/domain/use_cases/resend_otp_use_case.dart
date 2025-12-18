import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';

class ResendOtpUseCase {
final AuthRepository _authRepository ;
const ResendOtpUseCase(this._authRepository) ;
Future<Either<Failure,Unit>> call()async{
return await _authRepository.resendOtp() ;
}
}