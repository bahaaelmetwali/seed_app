import 'package:dio/dio.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/cache_helper.dart';
import 'package:seed_app/features/log_out_stream.dart';

class DioHelper {
  static const String baseUrl = 'https://docorizer.ghonim.makkah.solutions/v1/';
  DioHelper();
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) => status != null && status < 400,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
    tokenInterceptor(dio);

    return dio;
  }

  void tokenInterceptor(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getIt<CacheHelper>().getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (err, handler) async {
          if (err.response?.statusCode == 401 ||
              err.response?.statusCode == 403) {
            // Logout_Stream
            getIt<LogoutStream>().addEvent('logout');
            await getIt<CacheHelper>().clearUserData();

     
          }
          handler.next(err);
        },
      ),
    );
  }
}