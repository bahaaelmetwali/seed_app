import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:seed_app/core/utils/api_service.dart';
import 'package:seed_app/core/utils/cache_helper.dart';
import 'package:seed_app/core/utils/dio_helper.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';
import 'package:seed_app/features/auth/data/data_source/remote_data_source.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';
import 'package:seed_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed_app/features/auth/domain/use_cases/verification_use_case.dart';
import 'package:seed_app/features/log_out_stream.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/data/repo_impl/auth_repo_impl.dart';

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
  final dio = DioHelper().createDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(getIt<CacheHelper>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(getIt<AuthRemoteDataSource>(), getIt<LocalDataSource>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<VerificationUseCase>(
    () => VerificationUseCase(getIt<AuthRepository>()),
  );

}
