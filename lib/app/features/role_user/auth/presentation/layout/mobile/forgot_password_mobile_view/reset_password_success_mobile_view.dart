import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/forgot_password_controller.dart';

class SuccessNotificationMobileView extends GetView<ForgotPassWordController> {
  const SuccessNotificationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.splash(
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
                    child: AppText.headlineLarge(
                      text: 'Congrats!',
                      color: ThemeColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText.titleLarge(
                    text: 'Password reset successful',
                  ),
                ],
              ),
            ),
            AppPadding.regular(child: AppButton.max(title: 'Back', onPressed: controller.onPressedBackSuccess)),
          ],
        ),
      ),
    );
  }
}
