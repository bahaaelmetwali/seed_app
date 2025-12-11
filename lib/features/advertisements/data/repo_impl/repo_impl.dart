import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/core/utils/handle_request.dart';
import 'package:seed_app/features/advertisements/data/data_source.dart/advertisment_data_source.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';
import 'package:seed_app/features/advertisements/domain/repo/advertisment_repository.dart';

class AdvertismentRepositoryImpl implements AdvertismentRepository {
  final AdvertismentRemoteDataSource _advertismentRemoteDataSource;
  AdvertismentRepositoryImpl(this._advertismentRemoteDataSource);
  @override
  Future<Either<Failure, List<City>>> getCities() {
    return handleRequest<List<City>>(
      request: () async {
        final response = await _advertismentRemoteDataSource.fetchCities();
        final listOfCities = response.map((city) => city.toEntity()).toList();
        return listOfCities;
      },
    );
  }
}
