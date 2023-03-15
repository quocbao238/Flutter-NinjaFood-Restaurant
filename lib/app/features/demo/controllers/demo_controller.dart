import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/theme/theme.dart';

class DemoController extends BaseController {
  Rx<int> counter = 0.obs;

  void changeTheme() {
    if (Get.theme.brightness == Brightness.dark) {
      return Get.changeTheme(ThemePrimary.lightTheme());
    }
    Get.changeTheme(ThemePrimary.darkTheme());
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
