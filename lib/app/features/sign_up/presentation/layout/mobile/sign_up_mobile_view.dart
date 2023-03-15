import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ninjafood/app/theme/core_widget/app_scaffold_background.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

import 'widgets/socical_component.dart';

class SignUpMobileScreen extends GetView {
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
                    text: 'Login To Your Account',
                    fontWeight: FontWeight.bold,
                  )),
              AppTextFormField(),
              AppPadding(
                  padding: AppEdgeInsets.only(
                      top: AppGapSize.medium, bottom: AppGapSize.medium),
                  child: AppTextFormField()),
              AppText.bodySmall(
                  text: 'Or Continue With', fontWeight: FontWeight.bold),
              SocialComponent(),
              AppText.bodySmall(
                text: 'Forgot Your Password?',
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),
              AppPadding.large(
                child: AppButton.max(
                  title: 'Login',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
