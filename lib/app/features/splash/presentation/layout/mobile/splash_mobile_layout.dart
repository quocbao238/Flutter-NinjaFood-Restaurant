import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/splash/controllers/splash_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SplashMobileLayout extends StatelessWidget {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(sharedPreferencesService: Get.find()),
      builder: (controller) => AppScaffoldBackgroundImage(
        type: BackgroundImageType.splash,
        body: Center(
          child: AppImages.logo(),
        ),
      ),
    );
  }
}
