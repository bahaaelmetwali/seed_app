
import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';
import 'package:seed_app/features/advertisements/domain/repo/advertisment_repository.dart';

class GetCitiesUseCase {
  final AdvertismentRepository _repository;

  GetCitiesUseCase(this._repository);

  Future<Either<Failure, List<City>>> call() {
    return  _repository.getCities();
  }
}