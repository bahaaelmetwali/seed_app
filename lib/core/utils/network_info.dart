import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> checkNetwork();
}

class NetworkChecker implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;
  NetworkChecker(this._connectionChecker);
  @override
  Future<bool> checkNetwork() => _connectionChecker.hasConnection;
}
