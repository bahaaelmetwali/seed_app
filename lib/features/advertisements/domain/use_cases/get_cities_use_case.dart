import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';
import 'package:seed_app/features/advertisements/domain/repo/static_repository.dart';

class GetCitiesUseCase {
  final StaticRepository _repository;

  GetCitiesUseCase(this._repository);

  Future<Either<Failure, List<City>>> call() {
    return _repository.getCities();
  }
}
