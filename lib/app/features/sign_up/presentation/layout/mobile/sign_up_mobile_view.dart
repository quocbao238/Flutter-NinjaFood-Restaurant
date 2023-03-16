import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_up/controllers/sign_up_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';
import 'package:ninjafood/app/theme/theme.dart';
import 'widgets/socical_component.dart';

class SignUpMobileScreen extends GetView<SignUpController> {
  const SignUpMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              AppPadding(
                  padding: AppEdgeInsets.only(
                      top: AppGapSize.verylarge, bottom: AppGapSize.large),
                  child: AppText.headlineMedium(
                      text: 'SignUpScreen_Title'.tr,
                      fontWeight: FontWeight.bold)),
              AppTextFormField(),
              AppPadding(
                  padding: AppEdgeInsets.only(
                      top: AppGapSize.medium, bottom: AppGapSize.medium),
                  child: AppTextFormField()),
              AppText.bodySmall(
                  text: 'SignUpScreen_AnotherLogin'.tr,
                  fontWeight: FontWeight.bold),
              SocialComponent(),
              GestureDetector(
                onTap: controller.onPressedForgotPassword,
                child: AppText.bodySmall(
                    text: 'SignUpScreen_ForgotPassword'.tr,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.primaryColor),
              ),
              AppPadding.large(
                  child: AppButton.max(
                      title: 'SignUpScreen_LoginBtn'.tr,
                      onPressed: controller.onPressedLogin)),
            ],
          ),
        ),
      ),
    );
  }
}
