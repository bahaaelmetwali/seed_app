import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:seed_app/core/utils/api_service.dart';
import 'package:seed_app/core/utils/cache_helper.dart';
import 'package:seed_app/core/utils/dio_helper.dart';
import 'package:seed_app/features/log_out_stream.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  //logout stream
  getIt.registerLazySingleton(() => LogoutStream());
  // cache locator
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>()),
  );
  // dio options for main api service
  final dio = DioHelper().createDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}