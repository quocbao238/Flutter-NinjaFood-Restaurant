import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_in_controller.dart';
import 'sign_in_social_button.dart';

class SignInRowButton extends GetView<SignInController> {
  const SignInRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SignInSocialButton(
          title: 'Facebook',
          iconWidget: AppIcons.facebook(),
          onPressed: controller.onPressedSocialFacebook,
        )),
        AppPadding.small(),
        Expanded(
          child: SignInSocialButton(
            title: 'Google',
            iconWidget: AppIcons.google(),
            onPressed: controller.onPressedSocialGoogle,
          ),
        ),
      ],
    );
  }
}
