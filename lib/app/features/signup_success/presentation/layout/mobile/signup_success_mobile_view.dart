import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/signup_success/controller/signup_success_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignupSuccessMobileView extends StatelessWidget {
  const SignupSuccessMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupSuccessController>(
      init: SignupSuccessController(authController: Get.find<AuthController>()),
      builder: (controller) => AppScaffoldBackgroundImage.splash(
        onPressBackButton: () => Get.back(),
        body: Center(
          child: AppImages.logo(),
        ),
      ),
    );

    return AppScaffoldBackgroundImage.splash(
      onPressBackButton: () {},
      body: Column(),
    );
  }
}
