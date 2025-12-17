import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  Future<void> saveToken({required String token}) async {
    await _prefs.setString('token', token);
  }

  String? getToken() {
    return _prefs.getString('token');
  }

  void clearUserData() {
    _prefs.clear();
  }
}
