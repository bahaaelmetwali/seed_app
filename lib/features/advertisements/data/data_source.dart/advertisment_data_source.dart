import 'package:seed_app/core/utils/api_service.dart';
import 'package:seed_app/features/advertisements/data/models/advertisment_model.dart';

abstract class AdvertismentDataSource {
  Future<List<AdvertismentModel>> fetchAdvertisments();
}

class AdvertismentDataSourceImpl implements AdvertismentDataSource {
  final ApiService _apiService;
  AdvertismentDataSourceImpl(this._apiService);

  @override
  Future<List<AdvertismentModel>> fetchAdvertisments() async {
    final response = await _apiService.get(endPoint: 'advertisements');
    final listofAds = (response['data'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final ads = listofAds
        .map((json) => AdvertismentModel.fromJson(json))
        .toList();
    return ads;
  }
}
