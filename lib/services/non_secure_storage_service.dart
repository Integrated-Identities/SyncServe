import 'package:shared_preferences/shared_preferences.dart';

class NonSecureStorageService {
  NonSecureStorageService._(this._prefs);
  final SharedPreferences _prefs;

  static Future<NonSecureStorageService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return NonSecureStorageService._(prefs);
  }

  Future<void> saveString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
