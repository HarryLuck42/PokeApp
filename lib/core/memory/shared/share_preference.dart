import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._private();

  factory SharedPreference() {
    return _instance;
  }

  static final SharedPreference _instance = SharedPreference._private();

  static SharedPreferences? _preferences;

  static Future onInitialSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void writeStorage(String key, value) {
    if(_preferences != null){
      if (value is String) {
        _preferences!.setString(key, value);
      }
      if (value is bool) {
        _preferences!.setBool(key, value);
      }
      if (value is int) {
        _preferences!.setInt(key, value);
      }
      if (value is double) {
        _preferences!.setDouble(key, value);
      }
      if (value is List<String>) {
        _preferences!.setStringList(key, value);
      }
    }
  }

  dynamic readStorage(String k) {
    final result = _preferences?.get(k);
    return result;
  }

  void removeValue(String k) {
    if(_preferences != null){
      _preferences!.remove(k);
    }
  }
}