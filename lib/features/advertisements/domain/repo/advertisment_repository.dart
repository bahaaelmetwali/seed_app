import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';

abstract class AdvertismentRepository {
  Future<Either<Failure, List<Advertisment?>>> getadvertisments();
}
