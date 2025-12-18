import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';

abstract class StaticRepository {
  Future<Either<Failure, List<City>>> getCities();
}
