import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends BaseController {
  late final SharedPreferences _prefs;
  Rx<bool> isDarkTheme = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    _getCurrentTheme();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getCurrentTheme() async {
    isDarkTheme(_prefs.getBool('currentTheme') ?? false);
    print(isDarkTheme.value);
    if (isDarkTheme.value) {
      changeTheme();
    }
  }

  Future<void> changeTheme() async {
    ThemeMode themeMode;

    if (isDarkTheme.value) {
      themeMode = ThemeMode.light;
      await _prefs.setBool('currentTheme', false);
      isDarkTheme.value = false;
      return Get.changeThemeMode(themeMode);
    }

    themeMode = ThemeMode.dark;
    await _prefs.setBool('currentTheme', true);
    isDarkTheme.value = true;
    Get.changeThemeMode(themeMode);
  }
}
