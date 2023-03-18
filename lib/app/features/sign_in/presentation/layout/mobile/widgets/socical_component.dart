import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/sign_in/controllers/sign_in_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

import 'social_button.dart';

class SocialComponent extends GetView<SignInController> {
  const SocialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SocialButtonWidget(
          title: 'Facebook',
          iconWidget: AppIcons.facebook(),
          onPressed: controller.onPressedSocialFacebook,
        )),
        AppPadding.small(),
        Expanded(
          child: SocialButtonWidget(
            title: 'Google',
            iconWidget: AppIcons.google(),
            onPressed: controller.onPressedSocialGoogle,
          ),
        ),
      ],
    );
  }
}
