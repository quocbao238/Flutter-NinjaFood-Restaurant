import 'package:flutter/foundation.dart' show kDebugMode;
import 'dart:developer' as developer;

enum LogLevel { DEBUG, WARNING, ERROR }

class AppConsoleService {
  final bool flutterLogs;
  static final AppConsoleService _instance =
      AppConsoleService._internal(kDebugMode);

  factory AppConsoleService() {
    return _instance;
  }

  AppConsoleService._internal(this.flutterLogs) {
    show('Normal Log', 'This is normal log');
    showWarning('Warning Log', 'This is warning log');
    showError('Error Log', 'This is error log');
  }

  // log events, states etc...
  void show(String logName, String message) {
    developer.log('\x1B[32m${'[$logName]: $message'}\x1B[0m',
        name: 'AppConsoleService',
        time: DateTime.now(),
        level: LogLevel.DEBUG.index);
    _showFlutterLogs(logName, message);
  }

  void showWarning(String logName, String message) {
    developer.log('\x1B[33m${'[$logName]: $message'}\x1B[0m',
        name: 'AppConsoleService',
        time: DateTime.now(),
        level: LogLevel.WARNING.index);
    _showFlutterLogs(logName, message);
  }

  void showError(String logName, String message) {
    developer.log('\x1B[31m${'[$logName]: $message'}\x1B[0m',
        name: 'AppConsoleService',
        time: DateTime.now(),
        level: LogLevel.ERROR.index);
    _showFlutterLogs(logName, message);
  }

  void _showFlutterLogs(String logName, String message) {
    if (flutterLogs) print('[$logName] $message');
  }
}
