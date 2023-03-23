import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/signup_success/controller/signup_success_controller.dart';

class SignupSuccessMobileView extends GetView<SignupSuccessController> {
  const SignupSuccessMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.splash(
      onPressBackButton: () {},
      body: Column(),
    );
  }
}
