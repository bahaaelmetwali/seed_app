import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/errors/failure.dart';
import 'package:seed_app/core/utils/handle_request.dart';
import 'package:seed_app/features/advertisements/data/data_source.dart/advertisment_data_source.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/domain/repo/advertisment_repository.dart';

class AdvertismentRepositoryImpl implements AdvertismentRepository {
  final AdvertismentDataSource _advertismentDataSource;
  AdvertismentRepositoryImpl(this._advertismentDataSource);

  @override
  Future<Either<Failure, List<Advertisment?>>> getadvertisments({
    required int page,
    required int limit,
    required int cityId,
  }) {
    return handleRequest<List<Advertisment?>>(
      request: () async {
        final response = await _advertismentDataSource.fetchAdvertisments(
          page: page,
          limit: limit,
          cityId: cityId,
        );
        final listofAds = response.map((ad) => ad.toEntity()).toList();
        return listofAds;
      },
    );
  }
}
