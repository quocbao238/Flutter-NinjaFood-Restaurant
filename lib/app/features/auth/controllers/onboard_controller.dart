import 'package:flutter/material.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/auth/infrastructure/models/onboard_model.dart';

class OnboardController extends BaseController {
  List<OnboardModel> onboardListData = OnboardModel.listData;
  late final PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
