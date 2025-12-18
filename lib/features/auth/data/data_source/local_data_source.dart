import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/helpers/cache_helper.dart';

abstract class LocalDataSource {
  Future<Unit> cacheToken(String token);
  Future<Unit> cacheUserType( );
  String? getToken();
  Unit clearToken();
  String? getType();
}

class LocalDataSourceImpl implements LocalDataSource {
  final CacheHelper _cacheHelper;
  LocalDataSourceImpl(this._cacheHelper);
  @override
  Future<Unit> cacheToken(String token) async {
    await _cacheHelper.saveToken(token: token);
    return Future.value(unit);
  }

  @override
  String? getToken() {
    final String? token = _cacheHelper.getToken();
    return token;
  }

  @override
  Unit clearToken() {
    _cacheHelper.clearUserData();
    return unit;
  }

  @override
  Future<Unit> cacheUserType( ) async {
    final String? token = _cacheHelper.getToken();
    if (token == null || token.isEmpty) {
      await _cacheHelper.saveuserType(userType: 'guest');
    } else {
      await _cacheHelper.saveuserType(userType: 'user');
    }
    return Future.value(unit);
  }

  @override
  String? getType() {
    final String? userType = _cacheHelper.getuserType();
    return userType;
  }
}
