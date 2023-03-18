import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/services/services.dart';

class ThemeService extends GetxService {
  final SharedPreferencesService prefsService;
  Rx<bool> isDarkTheme = false.obs;

  ThemeService({required this.prefsService});

  Future<void> call() async {
    final lcoalTheme =
        prefsService.getBool(SharedPreferencesKey.isDarkThemeKey) ?? false;
    isDarkTheme.value = lcoalTheme;
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

  Future<void> _writeCurrentThemeToLocal(bool isDarkTheme) async {
    await prefsService.writeBool(
        SharedPreferencesKey.isDarkThemeKey, isDarkTheme);
  }
}
