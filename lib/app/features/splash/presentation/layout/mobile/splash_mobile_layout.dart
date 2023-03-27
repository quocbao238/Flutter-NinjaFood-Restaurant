import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/splash/controllers/splash_controller.dart';

class SplashMobileLayout extends StatelessWidget {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    return AppScaffoldBackgroundImage.splash(
      body: Center(
        child: AppImages.logo(),
      ),
    );
  }
}
