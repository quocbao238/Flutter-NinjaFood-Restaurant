import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/forgot_password_controller.dart';

class ResetPasswordBoxEmail extends GetView<ForgotPassWordController> {
  const ResetPasswordBoxEmail({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => AppTextFormField.email(
            hintText: 'Email',
            controller: controller.emailController,
            errorText: controller.emailError.value),
      );
}
