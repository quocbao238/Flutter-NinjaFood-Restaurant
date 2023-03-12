import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';

class DemoController extends BaseController {
  Rx<int> counter = 0.obs;

  void increment() {
    counter.value = 15;
    // counter.value = counter.value + 1;
  }

  void decrement() {
    int value = counter.value;
    if (value == 0) {
      return;
    }
    counter.value = --value;
  }

  void onPressedOnBoardScreen() {
    final lastValue = counter.value;

    Get.toNamed(AppRouteProvider.onboardScreen, arguments: lastValue);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class HomeScreenController extends BaseController {}
