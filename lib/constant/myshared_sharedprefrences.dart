import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  // Internal method to ensure prefs is initialized
  static Future<void> _ensurePrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveUserData({
    required String type,
    required String mobile,
    required String password,
  }) async {
    await _ensurePrefs();
    await _prefs!.setString('type', type);
    await _prefs!.setString('mobile', mobile);
    await _prefs!.setString('password', password);
  }

  static Future<Map<String, String?>> getUserData() async {
    await _ensurePrefs(); // Ensure prefs is initialized
    return {
      'type': _prefs!.getString('type'),
      'mobile': _prefs!.getString('mobile'),
      'password': _prefs!.getString('password'),
    };
  }

  static Future<void> saveToken({String? token}) async {
    await _ensurePrefs();
    await _prefs!.setString("currentToken", token!);
  }

  static Future<String?> getToken() async {
    await _ensurePrefs();
    String? token = _prefs!.getString("currentToken");

    return token;
  }

  static Future<void> setBool(String key, bool value) async {
    await _ensurePrefs();
    await _prefs!.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    await _ensurePrefs();
    return _prefs!.getBool(key);
  }

  static Future<void> remove(String key) async {
    await _ensurePrefs();
    await _prefs!.remove(key);
  }

  static Future<void> clear() async {
    await _ensurePrefs();
    await _prefs!.clear();
  }
}
