import 'package:dio/dio.dart';
import 'package:seed_app/core/log_out_stream.dart';
import 'package:seed_app/core/utils/constants/constants.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';

class DioHelper {
  final TokenInterceptor tokenInterceptor;
  final ErrorInterceptor errorInterceptor;

  DioHelper({required this.tokenInterceptor, required this.errorInterceptor});

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
      tokenInterceptor,
      errorInterceptor,
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
  final LocalDataSource _localDataSource;
  TokenInterceptor(this._localDataSource);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _localDataSource.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  final LocalDataSource localDataSource;
  final LogoutStream logoutStream;

  ErrorInterceptor(this.localDataSource, this.logoutStream);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      localDataSource.clearToken();
      logoutStream.addEvent('logout');
      handler.reject(err);
    } else {
      handler.next(err);
    }
  }
}
