import 'package:ninjafood/app/services/auth_service/auth_service.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';
import 'package:ninjafood/app/services/theme_service/theme_service.dart';
import 'package:tuple/tuple.dart';
import 'boot_services.dart';
import 'notification_service/notification_service.dart';
export 'auth_service/auth_service.dart';

final List<Tuple2<BootableService, int>> listBootServices = [
  Tuple2(ConsoleService(), 1024),
  Tuple2(ThemeService(), 512),
  Tuple2(AuthService(), 256),
  Tuple2(DatabaseService(), 128),
  Tuple2(NotificationService(), 64),
  Tuple2(CloudStorageService(), 32),
];

Future bootAppServices() async {
  await BootServices().boot(listBootServices);
}
