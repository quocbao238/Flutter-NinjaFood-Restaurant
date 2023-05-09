import 'package:get/get.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';
import 'dart:developer' as developer;
import 'package:logger/logger.dart';

part 'console_service_enum.dart';

// Color console log support vscode
// If use any other IDE, set useLogger = true
class ConsoleService extends GetxService implements Bootable {
  static ConsoleService get instance => Get.find<ConsoleService>();

  bool flutterLogs = false;

  // kDebugMode;

  bool useLogger = true;

  final logger = Logger(printer: PrettyPrinter());
  final loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: false, printEmojis: true),
  );

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    show('Normal Log', 'This is normal log');
    showWarning('Warning Log', 'This is warning log');
    showError('Error Log', 'This is error log');
  }

  // log events, states etc...
  void show(String logName, String message) {
    if (useLogger) {
      loggerNoStack.d(message, logName);
    } else {
      developer.log('\x1B[32m${'$message'}\x1B[0m',
          name: logName, time: DateTime.now(), level: LogLevel.DEBUG.index);
    }
    _showFlutterLogs(logName, message);
  }

  void showWarning(String logName, String message) {
    if (useLogger) {
      logger.w(logName, message);
    } else {
      developer.log('\x1B[33m${'$message'}\x1B[0m',
          name: logName, time: DateTime.now(), level: LogLevel.WARNING.index);
    }

    _showFlutterLogs(logName, message);
  }

  void showError(String logName, String message) {
    if (useLogger) {
      logger.e(logName, message);
    } else {
      developer.log('\x1B[31m${'$message'}\x1B[0m',
          name: logName, time: DateTime.now(), level: LogLevel.ERROR.index);
    }
    _showFlutterLogs(logName, message);
  }

  void _showFlutterLogs(String logName, String message) {
    if (flutterLogs) print('[$logName] $message');
  }
}
