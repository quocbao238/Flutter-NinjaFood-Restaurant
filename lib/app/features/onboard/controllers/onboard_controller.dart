import 'package:flutter/material.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/onboard/infrastructure/models/onboard_model.dart';

class OnboardController extends BaseController {
  List<OnboardModel> onboardListData = OnboardModel.listData;
  late final PageController pageController;
  late final int lastCounter;

  @override
  void onInit() {
    // lastCounter = Get.arguments;

    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
