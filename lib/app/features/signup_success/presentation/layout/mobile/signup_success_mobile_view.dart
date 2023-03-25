import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/signup_success/controller/signup_success_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class SignupSuccessMobileView extends StatelessWidget {
  const SignupSuccessMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupSuccessController>(
      init: SignupSuccessController(authController: Get.find<AuthController>()),
      builder: (controller) => AppScaffoldBackgroundImage.splash(
        body: AppSizeScale(
          ratioWidth: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.success(),
                    AppPadding.regular(
                      child: AppText.headlineMedium(
                        text: 'Congrats!',
                        color: ThemeColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppText.bodyLarge(
                      text: 'Your Profile Is Ready To Use',
                    ),
                  ],
                ),
              ),
              AppPadding.regular(child: AppButton.max(title: 'Next', onPressed:  controller.onPressedNext)),
            ],
          ),
        ),
      ),
    );

  }
}
