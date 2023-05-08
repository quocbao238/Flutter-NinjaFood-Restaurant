library global_controller;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/controllers/restaurant_controller.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/profile_controller.dart';
import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/notification_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/one_signal_service/one_signal_service.dart';
import 'package:ninjafood/app/services/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'dialog_controller.dart';

part 'message_controller.dart';

part 'user_controller.dart';

part 'notification_controller.dart';

final Map<Bootable, int> listBootsController = {
  DialogController(): 1024,
  UserController(): 512,
  RestaurantController(): 256,
  DeliveryController(): 128,
  MessageController(): 64,
  NotificationController(): 32,
};
