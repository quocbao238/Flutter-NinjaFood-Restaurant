import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_up_process/controller/sign_up_process_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignUpProcessMobileScreen extends GetView<SignUpProcessController> {
  const SignUpProcessMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      AppText.headlineLarge(
                        textAlign: TextAlign.start,
                        text: 'SignUpProcessScreen_Title'.tr,
                      ),
                      AppPadding(
                        padding: AppEdgeInsets.only(top: AppGapSize.medium),
                        child: AppText.bodySmall(
                          textAlign: TextAlign.start,
                          text: 'SignUpProcessScreen_Description'.tr,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      AppTextFormField(
                        obscureText: false,
                        hintText: 'SignUpProcessScreen_FirstName'.tr,
                      ),
                      AppPadding(
                        padding: AppEdgeInsets.symmetric(
                            vertical: AppGapSize.medium),
                        child: AppTextFormField(
                          obscureText: false,
                          hintText: 'SignUpProcessScreen_LastName'.tr,
                        ),
                      ),
                      AppTextFormField(
                        obscureText: false,
                        hintText: 'SignUpProcessScreen_MobileNumber'.tr,
                      ),
                    ],
                  )
                ],
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.only(top: AppGapSize.verylarge),
              child: AppButton.min(
                title: 'SignUpProcessScreen_Next'.tr,
                onPressed: controller.onPressedNext,
              ),
            )
          ],
        ),
      ),
    );
  }
}
