import 'package:dio/dio.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/errors/exceptions.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';

class DioHelper {
  DioHelper();
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        validateStatus: (status) => status != null && status < 400,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          'Content-Type': 'application/json',
          'Api-Key': Constants.apiKey,
        },
      ),
    );

    dio.interceptors.addAll([
      getIt<TokenInterceptor>(),
      getIt<ErrorInterceptor>(),
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    ]);

    return dio;
  }
}

class TokenInterceptor extends Interceptor {
  TokenInterceptor();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getIt<LocalDataSource>().getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(err, handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: UnauthorizedException(),
          response: err.response,
        ),
      );
    } else {
      handler.next(err);
    }
  }
}
