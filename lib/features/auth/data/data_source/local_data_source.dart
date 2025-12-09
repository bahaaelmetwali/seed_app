import 'package:dartz/dartz.dart';
import 'package:seed_app/core/utils/cache_helper.dart';

abstract class LocalDataSource {
  Future<Unit> cacheToken(String token) ;
}

class LocalDataSourceImpl implements LocalDataSource {
  final CacheHelper _cacheHelper ;
  LocalDataSourceImpl(this._cacheHelper) ;
  @override
  Future<Unit> cacheToken(String token) async{
   await _cacheHelper.saveToken(token: token) ;
   return Future.value(unit) ;
  }
}