import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/core/utils/handle_request.dart';
import 'package:seed_app/features/advertisements/data/data_source.dart/static_data_source.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';
import 'package:seed_app/features/advertisements/domain/repo/static_repository.dart';

class StaticRepositoryImpl implements StaticRepository {
  final StaticRemoteDataSource _staticRemoteDataSource;
  StaticRepositoryImpl(this._staticRemoteDataSource);
  @override
  Future<Either<Failure, List<City>>> getCities() {
    return handleRequest<List<City>>(
      request: () async {
        final response = await _staticRemoteDataSource.fetchCities();
        final listOfCities = response.map((city) => city.toEntity()).toList();
        return listOfCities;
      },
    );
  }
}
