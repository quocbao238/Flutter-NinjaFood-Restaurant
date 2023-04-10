library global_controller;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';
import 'package:ninjafood/app/services/notification_service/notification_service.dart';
import 'package:ninjafood/app/services/services.dart';
import 'package:ninjafood/app/widgets/app_dialog.dart';
import 'package:tuple/tuple.dart' as tuple;

import 'boot_controllers.dart';

part 'dialog_controller.dart';

part 'message_controller.dart';

part 'user_controller.dart';

final List<tuple.Tuple2<BootableController, int>> listControllerBoots = [
  tuple.Tuple2(DialogController(), 1024),
  tuple.Tuple2(UserController(), 512),
  tuple.Tuple2(MessageController(), 124),
];

Future bootGlobalControllers() async {
  await BootControllers().boot(listControllerBoots);
}
