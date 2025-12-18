import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';

abstract class AdvertismentRepository {
  Future<Either<Failure, List<Advertisment>>> getadvertisments({
    required int page,
    required int limit,
    required int cityId,
  });
}
