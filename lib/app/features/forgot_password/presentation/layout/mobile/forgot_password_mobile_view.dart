import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordMobileView extends GetView<ForgotPassWordController> {
  const ForgotPasswordMobileView({super.key});

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
          AppPadding.regular(
            child: AppButton.max(
                title: 'Next_Button'.tr, onPressed: controller.onPressedNext),
          ),
        ],
      ),
    );
  }
}
