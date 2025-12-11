import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/domain/repo/advertisment_repository.dart';

class GetAdsUseCase {
  final AdvertismentRepository _advertismentRepository;
  GetAdsUseCase(this._advertismentRepository);
  Future<Either<Failure, List<Advertisment?>>> call() async {
    return await _advertismentRepository.getadvertisments();
  }
}
