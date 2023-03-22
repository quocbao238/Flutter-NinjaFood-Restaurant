import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/splash/controllers/splash_controller.dart';

class SplashMobileLayout extends StatelessWidget {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(sharedPreferencesService: Get.find()),
      builder: (controller) => AppScaffoldBackgroundImage.splash(
        body: Center(
          child: AppImages.logo(),
        ),
      ),
    );
  }
}
