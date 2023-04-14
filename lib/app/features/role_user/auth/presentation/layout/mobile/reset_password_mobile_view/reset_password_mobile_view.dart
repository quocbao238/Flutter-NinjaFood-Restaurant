import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/forgot_password_controller.dart';
import 'reset_password_box_email.dart';

class ResetPasswordMobileView extends GetView<ForgotPassWordController> {
  const ResetPasswordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      onPressBackButton: controller.onPressBack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppPadding(
            padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
            child: AppText.headlineSmall(
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                text: 'Forgot password?'.tr),
          ),
          AppPadding.medium(
            child: AppText.bodyMedium(
              text:
                  'Select which contact details should we use to reset your password'
                      .tr,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ),
          AppPadding.medium(child: ResetPasswordBoxEmail()),
          AppPadding.regular(
            child: AppButton.max(
                title: 'Send'.tr, onPressed: controller.onPressedSend),
          ),
        ],
      ),
    );
  }
}
