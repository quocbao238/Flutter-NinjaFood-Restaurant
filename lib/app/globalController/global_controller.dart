library global_controller;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/globalController/boot_controllers.dart';
import 'package:ninjafood/app/globalController/message_controller.dart';
import 'package:ninjafood/app/globalController/userController.dart';
import 'package:ninjafood/app/widgets/app_dialog.dart';
import 'package:tuple/tuple.dart';

part 'dialog_controller.dart';

final List<Tuple2<BootableController, int>> listControllerBoots = [
  Tuple2(DialogController(), 1024),
  Tuple2(UserController(), 512),
  Tuple2(MessageController(), 124),
];

Future bootGlobalControllers() async {
  await BootControllers().boot(listControllerBoots);
}
