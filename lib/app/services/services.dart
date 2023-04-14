import 'package:ninjafood/app/services/auth_service/auth_service.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';
import 'package:ninjafood/app/services/theme_service/theme_service.dart';
import 'boot_service/boot_services.dart';
import 'notification_service/notification_service.dart';
export 'auth_service/auth_service.dart';
export 'cloud_storage_service/cloud_storage_service.dart';
export 'console_service/console_service.dart';
export 'database_service/database_service.dart';
export 'theme_service/theme_service.dart';
export 'language_service/language_service.dart';
export 'notification_service/notification_service.dart';
export 'boot_service/boot_services.dart';

final Map<BootableService, int> listBootServices = {
  ConsoleService(): 1024,
  ThemeService(): 512,
  AuthService(): 256,
  DatabaseService(): 128,
  NotificationService(): 64,
  CloudStorageService(): 32,
};
