import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
export './shared_preferences_key.dart';

class SharedPreferencesService extends GetxService {
  SharedPreferences? _prefs;

  Future<void> call() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> writeBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  Future<bool> writeString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  String? getString(String key) {
    return _prefs!.getString(key);
  }
}
