import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';

abstract class AdvertismentRepository {
  Future<Either<Failure, List<City>>> getCities();
}