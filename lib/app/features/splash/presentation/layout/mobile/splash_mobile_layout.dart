import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/splash/controllers/splash_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class SplashMobileLayout extends StatelessWidget {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(localStorageController: Get.find<LocalStorageController>()),
      builder: (controller) => AppScaffoldBackgroundImage.splash(
        body: Center(
          child: AppImages.logo(),
        ),
      ),
    );
  }
}
