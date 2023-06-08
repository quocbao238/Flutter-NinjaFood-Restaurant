import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ThemeService extends GetxService implements Bootable {
  static ThemeService get instance => Get.find<ThemeService>();
  late final SharedPreferences _sharedPreferences;
  Rx<bool> isDarkTheme = false.obs;

  Future<void> call() async {
    Get.put(this, permanent: true);
    _sharedPreferences = await SharedPreferences.getInstance();
    final localTheme =
        _sharedPreferences.getBool(LocalStorageKey.isDarkThemeKey) ?? true;
    isDarkTheme.value = localTheme;
    if (isDarkTheme.value) {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  Future<void> toggleTheme() async {
    if (isDarkTheme.value) {
      _writeCurrentThemeToLocal(false);
      isDarkTheme.value = false;
      return Get.changeThemeMode(ThemeMode.light);
    }
    _writeCurrentThemeToLocal(true);
    isDarkTheme.value = true;
    Get.changeThemeMode(ThemeMode.dark);
  }

  Future<void> _writeCurrentThemeToLocal(bool isDarkTheme) async =>
      await _sharedPreferences.setBool(
          LocalStorageKey.isDarkThemeKey, isDarkTheme);
}
