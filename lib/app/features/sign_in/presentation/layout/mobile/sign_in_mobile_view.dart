import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/sign_in/controllers/sign_in_controller.dart';
import 'widgets/socical_component.dart';

class SignInMobileScreen extends GetView<SignInController> {
  const SignInMobileScreen({super.key});

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
                AppPadding(
                    padding: AppEdgeInsets.only(
                        top: AppGapSize.veryLarge,
                        bottom: AppGapSize.large,
                        left: AppGapSize.medium,
                        right: AppGapSize.medium),
                    child: AppText.headlineSmall(text: 'SignInScreen_Title'.tr, fontWeight: FontWeight.bold)),
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
                    hintText: 'SignInScreen_Password'.tr,
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: controller.onPressedForgotPassword,
                      child: AppText.bodySmall(textAlign: TextAlign.end, text: 'SignInScreen_ForgotPassword'.tr),
                    ),
                  ),
                ),
                AppPadding.medium(
                  child: AppButton.max(title: 'SignInScreen_LoginBtn'.tr, onPressed: controller.onPressedLogin),
                ),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: SocialComponent()),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.bodySmall(
                          textAlign: TextAlign.end, text: 'SignInScreen_DontAccount'.tr, fontWeight: FontWeight.w400),
                      GestureDetector(
                        onTap: controller.onPressedSignUp,
                        child: AppPadding.small(
                          child: AppText.bodySmall(
                              textAlign: TextAlign.end,
                              text: 'SignInScreen_SignUp'.tr,
                              fontWeight: FontWeight.w400,
                              color: ThemeColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
