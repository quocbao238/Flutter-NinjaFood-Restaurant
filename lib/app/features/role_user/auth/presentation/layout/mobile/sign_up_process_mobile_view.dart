import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class SignUpProcessMobileScreen extends GetView<SignUpProcessController> {
  const SignUpProcessMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        appBarWidget: CustomAppBar.back(),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPadding.small(),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                      child: AppText.headlineSmall(
                        textAlign: TextAlign.start,
                        text: 'SignUpProcessScreen_Title'.tr,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppPadding.medium(
                      child: AppText.bodyMedium(
                          textAlign: TextAlign.start,
                          text: 'SignUpProcessScreen_Description'.tr,
                          fontWeight: FontWeight.w400),
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical: AppGapSize.small),
                      child: AppTextFormField(
                        controller: controller.firstNameController,
                        errorText: controller.firstNameError.value,
                        hintText: 'SignUpProcessScreen_FirstName'.tr,
                      ),
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical: AppGapSize.small),
                      child: AppTextFormField(
                        controller: controller.lastNameController,
                        errorText: controller.lastNameError.value,
                        hintText: 'SignUpProcessScreen_LastName'.tr,
                      ),
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical: AppGapSize.small),
                      child: AppTextFormField.phone(
                        controller: controller.phoneController,
                        errorText: controller.phoneError.value,
                        hintText: 'SignUpProcessScreen_MobileNumber'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: AppPadding.regular(
                child: AppButton.max(
                    title: 'Next_Button'.tr, onPressed: controller.onPressedNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
