library service;

import 'dart:ui';
import 'package:get/get.dart';
import 'services.dart';
export './theme/theme_service.dart';
export './shared_preferences_service/shared_preferences_service.dart';
export './lang/translation_service.dart';
export './console_service/console_service.dart';

const _logName = 'Service';

AppConsoleService console = AppConsoleService();
Future<void> initService() async {
  console.show(_logName, 'Start Boot services ...');
  await Get.put(SharedPreferencesService())();
  await Get.put(
      ThemeService(prefsService: Get.find<SharedPreferencesService>()))();
  await TranslationService.init(Locale('vi', 'VN'));
  console.show(_logName, 'All services started...');
}
