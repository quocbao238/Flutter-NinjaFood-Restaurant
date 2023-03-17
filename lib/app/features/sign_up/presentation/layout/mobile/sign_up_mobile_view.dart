import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_up/controllers/sign_up_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';
import 'package:ninjafood/app/theme/theme.dart';

class SignUpMobileScreen extends GetView<SignUpController> {
  const SignUpMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.verylarge, bottom: AppGapSize.large),
                child: AppText.headlineMedium(
                  text: 'Sign Up For Free',
                  fontWeight: FontWeight.bold,
                ),
              ),
              //cần fix bug
              AppTextFormField(
                obscureText: false,
                hintText: 'Anamwp . .',
                prefixIcon: SvgPicture.asset(
                  'assets/icons/user_profile_icon.svg',
                  color: ThemeColors.primaryColor,
                ),
              ),
              //cần fix bug
              AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.medium, bottom: AppGapSize.medium),
                child: AppTextFormField(
                  obscureText: false,
                  hintText: 'Email',
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/email_icon.svg',
                    color: ThemeColors.primaryColor,
                  ),
                ),
              ),
              AppTextFormField(
                obscureText: true,
                hintText: 'SignInScreen_Password'.tr,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/password_icon.svg',
                  color: ThemeColors.primaryColor,
                ),
              ),
              AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.verylarge, bottom: AppGapSize.large),
                child: AppButton.min(
                  title: 'Create Account',
                  onPressed: controller.onPressedLogin,
                ),
              ),
              GestureDetector(
                onTap: controller.onPressedAlreadyHaveAnAccount,
                child: AppText.bodySmall(
                  text: 'already have an account?',
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
