library global_controller;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/sign_in/infrastructure/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import 'db_controller.dart';
import 'language_controller/en.dart';
import 'language_controller/vi.dart';
import 'local_storage_controller/local_storage_key.dart';
import 'package:fpdart/fpdart.dart';

part 'theme_controller.dart';

part 'console_controller.dart';

part 'dialog_controller.dart';

part 'local_storage_controller/local_storage_controller.dart';

part 'language_controller/language_controller.dart';

part 'auth_controller.dart';

const _logName = 'globalController';

Future<void> initGlobalController() async {
  await Get.put(ConsoleController())();
  final console = Get.find<ConsoleController>();
  console.show(_logName, 'Start Boot services ...');
  Get.put(DialogController());
  await Get.put(LocalStorageController())();
  await Get.put(ThemeController(localStorageController: Get.find<LocalStorageController>()))();
  await Get.put(DatabaseController(console: console))();
  await Get.put(AuthController(console: console, dbController: Get.find<DatabaseController>()))();
  await TranslationController.init(Locale('vi', 'VN'));
  console.show(_logName, 'All services started...');
}
