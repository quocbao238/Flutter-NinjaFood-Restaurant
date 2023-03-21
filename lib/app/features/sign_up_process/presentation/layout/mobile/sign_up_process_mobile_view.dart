import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_up_process/controller/sign_up_process_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignUpProcessMobileScreen extends GetView<SignUpProcessController> {
  const SignUpProcessMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      onPressBackButton: () {},
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPadding(
              padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.regular),
              child: AppText.headlineLarge(
                textAlign: TextAlign.start,
                text: 'SignUpProcessScreen_Title'.tr,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.regular, vertical: AppGapSize.medium),
              child: AppText.bodyMedium(
                textAlign: TextAlign.start,
                text: 'SignUpProcessScreen_Description'.tr,
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.regular, vertical: AppGapSize.small),
              child: AppTextFormField(
                obscureText: false,
                hintText: 'SignUpProcessScreen_FirstName'.tr,
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.regular, vertical: AppGapSize.small),
              child: AppTextFormField(
                obscureText: false,
                hintText: 'SignUpProcessScreen_LastName'.tr,
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.regular, vertical: AppGapSize.small),
              child: AppTextFormField(
                obscureText: false,
                hintText: 'SignUpProcessScreen_MobileNumber'.tr,
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.regular,
                  vertical: AppGapSize.verylarge),
              child: AppButton.max(
                  title: 'SignUpProcessScreen_Next'.tr,
                  onPressed: controller.onPressedNext),
            )
          ],
        ),
      ),
    );
  }
}
