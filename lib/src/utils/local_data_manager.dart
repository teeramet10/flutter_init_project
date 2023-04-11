import 'dart:convert';

import 'package:logbook/src/model/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataManager {
  static late LocalDataManager _instance;
  static late SharedPreferences _sharedPreferences;

  static const String loginData = "loginData";
  static const String isLogin = "isLogin";

  static Future<LocalDataManager> getInstance() async {
    _instance = LocalDataManager();
    _sharedPreferences = await SharedPreferences.getInstance();
    return _instance;
  }

  Future<bool> setLoginData(LoginResponse loginResponse) {
    String json = jsonEncode(loginResponse);
    return _sharedPreferences.setString(loginData, json);
  }

  Future<bool> setStateLogin() {
    return _sharedPreferences.setBool(isLogin, true);
  }

  Future<bool?> getStateLogin() {
    return Future<bool?>.value(_sharedPreferences.getBool(isLogin));
  }

  Future<void> removeLoginData() => _sharedPreferences.remove(loginData);

  Future<void> removeStateLogin() => _sharedPreferences.remove(isLogin);
}
