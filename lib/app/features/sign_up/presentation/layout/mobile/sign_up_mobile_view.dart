import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/sign_up/controllers/sign_up_controller.dart';

class SignUpMobileScreen extends GetView<SignUpController> {
  const SignUpMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.splash(
        isLoading: controller.loading.value,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImages.logo(),
                AppPadding.medium(
                  child: AppText.titleMedium(
                    text: 'SignUpScreen_Title'.tr,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                  child: AppTextFormField.email(
                      controller: controller.emailController,
                      errorText: controller.emailError.value,
                      hintText: 'Email'),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                  child: AppTextFormField.password(
                    controller: controller.passwordController,
                    errorText: controller.passwordError.value,
                    hintText: 'SignUpScreen_Password'.tr,
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                  child: AppTextFormField.password(
                    controller: controller.confirmPasswordController,
                    errorText: controller.confirmPasswordError.value,
                    hintText: 'SignUpScreen_Confirm_Password'.tr,
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(
                    vertical: AppGapSize.regular,
                    horizontal: AppGapSize.medium,
                  ),
                  child: AppButton.max(
                    title: 'SignUpScreen_CreateAccount'.tr,
                    onPressed: controller.onPressedCreateAccount,
                  ),
                ),
                GestureDetector(
                  onTap: controller.onPressedAlreadyHaveAnAccount,
                  child: AppText.bodySmall(
                    text: 'SignUpScreen_HaveAnAccount'.tr,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.primaryColor,
                  ),
                ),
                AppPadding.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
