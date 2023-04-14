library global_controller;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/comment_model.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/services.dart';
import 'package:ninjafood/app/widgets/widgets.dart';
import 'package:uuid/uuid.dart';
part 'dialog_controller.dart';
part 'message_controller.dart';
part 'user_controller.dart';

final Map<Bootable, int> listBootsController = {
  DialogController(): 1024,
  UserController(): 512,
  MessageController(): 124,
};
