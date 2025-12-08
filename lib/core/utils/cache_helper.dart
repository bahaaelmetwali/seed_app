import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  Future<void> saveToken({required String token}) async {
    await _prefs.setString('token', token);
  }


  Future<String?> getToken() async {
    return _prefs.getString('token');
  }


  Future<void> clearUserData() async {
    await _prefs.clear();
  }
}