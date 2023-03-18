import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_in/controllers/sign_in_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';
import 'package:ninjafood/app/theme/theme.dart';
import 'widgets/socical_component.dart';

class SignInMobileScreen extends GetView<SignInController> {
  const SignInMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImages.logo(),
              AppPadding(
                  padding: AppEdgeInsets.only(
                      top: AppGapSize.verylarge, bottom: AppGapSize.large),
                  child: AppText.headlineMedium(
                      text: 'SignInScreen_Title'.tr,
                      fontWeight: FontWeight.bold)),
              AppTextFormField(
                hintText: 'Email',
                obscureText: false,
              ),
              AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.medium, bottom: AppGapSize.medium),
                child: AppTextFormField(
                  hintText: 'SignInScreen_Password'.tr,
                  obscureText: true,
                ),
              ),
              GestureDetector(
                onTap: controller.onPressedForgotPassword,
                child: AppText.bodySmall(
                    textAlign: TextAlign.end,
                    text: 'SignInScreen_ForgotPassword'.tr,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.primaryColor),
              ),
              AppPadding.medium(
                child: AppButton.max(
                    title: 'SignInScreen_LoginBtn'.tr,
                    onPressed: controller.onPressedLogin),
              ),
              AppSizeScale(ratioWidth: 0.85, child: SocialComponent()),
              InkWell(
                onTap: controller.onPressedSignUp,
                child: AppPadding.medium(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.bodySmall(
                          textAlign: TextAlign.end,
                          text: 'SignInScreen_DontAccount'.tr,
                          fontWeight: FontWeight.w400),
                      AppText.bodySmall(
                          textAlign: TextAlign.end,
                          text: 'SignInScreen_SignUp'.tr,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.primaryColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
