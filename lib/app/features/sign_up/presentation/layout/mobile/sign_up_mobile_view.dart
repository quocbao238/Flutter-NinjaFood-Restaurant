import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_up/controllers/sign_up_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';
import 'package:ninjafood/app/theme/theme.dart';

class SignUpMobileScreen extends GetView<SignUpController> {
  const SignUpMobileScreen({super.key});

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
                  text: 'SignUpScreen_Title'.tr,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppTextFormField(
                  obscureText: false,
                  hintText: 'Anamwp . .',
                  prefixIcon: AppIcons.userProfile()),
              AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.medium, bottom: AppGapSize.medium),
                child: AppTextFormField(
                    obscureText: false,
                    hintText: 'Email',
                    prefixIcon: AppIcons.email()),
              ),
              AppTextFormField(
                  obscureText: true,
                  hintText: 'SignUpScreen_Password'.tr,
                  prefixIcon: AppIcons.password()),
              AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.verylarge, bottom: AppGapSize.large),
                child: AppButton.min(
                  title: 'SignUpScreen_CreateAccount'.tr,
                  onPressed: controller.onPressedLogin,
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
            ],
          ),
        ),
      ),
    );
  }
}
