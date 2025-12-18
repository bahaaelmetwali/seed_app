import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:seed_app/core/utils/error_handling/failure.dart';
import 'package:seed_app/core/utils/network_info.dart';

Future<Either<Failure, T>> handleRequest<T>({
  required Future<T> Function() request,
}) async {
  try {
    final network = NetworkChecker(InternetConnectionChecker.instance);

    final isConnected = await network.checkNetwork();

    if (!isConnected) {
      return left(NoNetworkFailure());
    }
    final response = await request();
    return right(response);
  } on DioException catch (dioError) {
    return left(ServiceFailure.fromDio(dioError));
  } catch (e) {
    return left(ServiceFailure(e.toString()));
  }
}
