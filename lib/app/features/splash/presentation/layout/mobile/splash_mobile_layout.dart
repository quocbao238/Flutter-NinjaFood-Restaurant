import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/splash/controllers/splash_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/theme/core_widget/app_scaffold_background.dart';

class SplashMobileLayout extends GetView<SplashController> {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5))
        .then((_) => Get.offAndToNamed(AppRouteProvider.onboardScreen));

    return AppScaffoldBackgroundImage(
        body: Center(child: Image.asset('assets/images/logo.png')));
  }
}
