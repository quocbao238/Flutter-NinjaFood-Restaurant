library service;

import 'dart:ui';
import 'package:get/get.dart';
import 'package:ninjafood/app/provider/app_write_client_provider.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/services/dialog_controller.dart';
import 'services.dart';
export 'theme_controller.dart';
export './shared_preferences_service/local_storage_controller.dart';
export './lang/language_controller.dart';
export 'console_controller.dart';

const _logName = 'Service';

AppConsoleService console = AppConsoleService();

Future<void> initService() async {
  console.show(_logName, 'Start Boot services ...');
  Get.put(DialogController());
  await Get.put(SharedPreferencesService())();
  await Get.put(ThemeController(prefsService: Get.find<SharedPreferencesService>()))();
  await TranslationService.init(Locale('vi', 'VN'));
  Get.put(AppWriteProvider())();
  await Get.put(AuthProvider())();
  console.show(_logName, 'All services started...');
}
