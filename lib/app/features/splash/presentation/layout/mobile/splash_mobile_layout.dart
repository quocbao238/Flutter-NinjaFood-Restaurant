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
      initState: (_) {},
      builder: (_) {
        return AppScaffoldBackgroundImage(
            body: Center(child: Image.asset('assets/images/logo.png')));
      },
    );
  }
}
