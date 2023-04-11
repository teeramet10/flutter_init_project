import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static late SharedPreferencesUtil _instance;
  static late SharedPreferences _sharedPreferences;

  static Future<SharedPreferencesUtil> getInstance() async {
    _instance = SharedPreferencesUtil();
    _sharedPreferences = await SharedPreferences.getInstance();

    return _instance;
  }

  Future<bool> setInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  int? getInt(String key) => _sharedPreferences.getInt(key);

  Future<bool> setString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  String? getString(String key) => _sharedPreferences.getString(key);

  Future<bool> setBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  bool? getBool(String key) => _sharedPreferences.getBool(key);

  Future<bool> setDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  Future<bool> setStringList(String key, List<String> value) =>
      _sharedPreferences.setStringList(key, value);

  List<String>? getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  Future<void> remove(String key) => _sharedPreferences.remove(key);
}
