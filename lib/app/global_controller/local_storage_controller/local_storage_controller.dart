part of global_controller;


class LocalStorageController extends GetxService {
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
