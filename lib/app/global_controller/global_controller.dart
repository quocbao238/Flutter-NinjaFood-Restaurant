library global_controller;

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/global_controller/firebase_message_controller.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/widgets/app_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import 'db_controller.dart';
import 'package:fpdart/fpdart.dart';

part 'theme_controller.dart';

part 'console_controller.dart';

part 'dialog_controller.dart';

part 'local_storage_controller/local_storage_controller.dart';

part 'auth_controller.dart';

part 'cloud_storage_controller.dart';

const _logName = 'globalController';

Future<void> initGlobalController() async {
  await Get.put(ConsoleController())();
  final console = Get.find<ConsoleController>();
  console.show(_logName, 'Start Boot services ...');
  Get.put(DialogController(), permanent: true);
  await Get.put(LocalStorageController())();
  await Get.put(ThemeController(localStorageController: Get.find<LocalStorageController>()))();
  await Get.put(DatabaseController(console: console))();
  await Get.put(FirebaseMessageController())();
  await Get.put(AuthController(
      firebaseMessageController: Get.find<FirebaseMessageController>(),
      console: console,
      dbController: Get.find<DatabaseController>()))();
  await Get.put(CloudStorageController())();
  console.show(_logName, 'All services started...');
}
