import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:seed_app/core/utils/api_service.dart';
import 'package:seed_app/core/utils/cache_helper.dart';
import 'package:seed_app/core/utils/dio_helper.dart';
import 'package:seed_app/features/advertisements/data/data_source.dart/advertisment_data_source.dart';
import 'package:seed_app/features/advertisements/data/data_source.dart/static_data_source.dart';
import 'package:seed_app/features/advertisements/data/repo_impl/advertisment_repository_impl.dart';
import 'package:seed_app/features/advertisements/data/repo_impl/static_repository_impl.dart';
import 'package:seed_app/features/advertisements/domain/repo/advertisment_repository.dart';
import 'package:seed_app/features/advertisements/domain/repo/static_repository.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_ads_use_case.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_cities_use_case.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_city/get_city_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/selected_city.dart/selected_city_cubit.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';
import 'package:seed_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:seed_app/features/auth/domain/repo/auth_repository.dart';
import 'package:seed_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:seed_app/features/auth/domain/use_cases/resend_otp_use_case.dart';
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
  getIt.registerLazySingleton<StaticRemoteDataSource>(
    () => StaticRemoteDataSourceeImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AdvertismentDataSource>(
    () => AdvertismentDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(getIt<CacheHelper>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(getIt<AuthRemoteDataSource>(), getIt<LocalDataSource>()),
  );
  getIt.registerLazySingleton<StaticRepository>(
    () => StaticRepositoryImpl(getIt<StaticRemoteDataSource>()),
  );
  getIt.registerLazySingleton<AdvertismentRepository>(
    () => AdvertismentRepositoryImpl(getIt<AdvertismentDataSource>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<VerificationUseCase>(
    () => VerificationUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetCitiesUseCase>(
    () => GetCitiesUseCase(getIt<StaticRepository>()),
  );
  getIt.registerLazySingleton<GetAdsUseCase>(
    () => GetAdsUseCase(getIt<AdvertismentRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepository>()),
  );
    getIt.registerLazySingleton<ResendOtpUseCase>(
    () => ResendOtpUseCase(getIt<AuthRepository>()),
  );



  getIt.registerLazySingleton<GetCityCubit>(
    () => GetCityCubit(
      getIt<GetCitiesUseCase>(),
      selectedCityCubit: SelectedCityCubit(),
    ),
  );
}
