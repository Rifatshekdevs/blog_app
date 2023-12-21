import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

// ignore: unused_element
  Future<void> _initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _tokenKey = 'token';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

 static loginCheck() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    print(_sharedPreferences.getBool('is-user'));
    if (_sharedPreferences.getBool('is-user') != null) {
      return _sharedPreferences.getBool('is-user');
    } else {
      return false;
    }
  }

  static Future<bool?> getBool() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //Return String
    bool? b = _sharedPreferences.getBool('is-user');
    print(b);
    return b;
  }

  static saveString({String? key, String? value}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.setString(key!, value!);
  }

 static saveBoolean({required String key, required bool value}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool(key, value);
  }

  /// save token
  static Future<void> setToken(String token) =>
      _sharedPreferences.setString(_tokenKey, token);

  /// save provider token

  /// get generated fcm token
  static String? getToken(RxString token) =>
      _sharedPreferences.getString(_tokenKey);

  /// get generated fcm token

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();
}
