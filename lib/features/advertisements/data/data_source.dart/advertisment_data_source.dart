import 'package:seed_app/core/utils/api_service.dart';
import 'package:seed_app/features/advertisements/data/models/city_model.dart';

abstract class AdvertismentRemoteDataSource {
  Future<List<CityModel>> fetchCities();
}

class AdvertismentRemoteDataSourceImpl implements AdvertismentRemoteDataSource {
  final ApiService _apiService;
  AdvertismentRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<CityModel>> fetchCities() async {
    final response = await _apiService.get(endPoint: 'cities');
    final listOfCities = (response['data'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final cities = listOfCities
        .map((json) => CityModel.fromJson(json))
        .toList();

    return cities;
  }
}
