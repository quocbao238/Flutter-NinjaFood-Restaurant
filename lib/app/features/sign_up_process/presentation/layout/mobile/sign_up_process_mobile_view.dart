import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_up_process/controller/sign_up_process_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignUpProcessMobileScreen extends GetView<SignUpProcessController> {
  const SignUpProcessMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.headlineLarge(
                    textAlign: TextAlign.start,
                    text: 'Fill in your bio to get\nstarted'),
                AppText.bodySmall(
                    textAlign: TextAlign.start,
                    text:
                        'This data will be displayed in your account\nprofile for security'),
              ],
            ),
            Column(
              children: [
                AppTextFormField(
                  obscureText: false,
                  hintText: 'First Name',
                ),
                AppPadding.medium(
                  child: AppTextFormField(
                    obscureText: false,
                    hintText: 'Last Name',
                  ),
                ),
                AppTextFormField(
                  obscureText: false,
                  hintText: 'Mobile Number',
                ),
              ],
            ),
            AppPadding(
              padding: AppEdgeInsets.only(top: AppGapSize.verylarge),
              child: AppButton.min(
                title: 'Next',
                onPressed: controller.onPressedNext,
              ),
            )
          ],
        ),
      ),
    );
  }
}
