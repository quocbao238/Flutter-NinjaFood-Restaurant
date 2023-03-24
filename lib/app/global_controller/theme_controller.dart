part of global_controller;

class ThemeController extends GetxService {
  final LocalStorageController localStorageController;
  Rx<bool> isDarkTheme = false.obs;

  ThemeController({required this.localStorageController});

  Future<void> call() async {
    final localTheme =
        localStorageController.getBool(LocalStorageKey.isDarkThemeKey) ?? false;
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

  Future<void> _writeCurrentThemeToLocal(bool isDarkTheme) async {
    await localStorageController.writeBool(
        LocalStorageKey.isDarkThemeKey, isDarkTheme);
  }
}
