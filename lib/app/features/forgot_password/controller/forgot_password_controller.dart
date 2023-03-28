import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';

const _logName = 'SignInController';

class ForgotPassWordController extends BaseController {
  final AuthController authController;

  ForgotPassWordController({required this.authController});

  late final TextEditingController emailController;
  Rxn<String?> emailError = Rxn<String?>(null);

  @override
  void onInit() {
    emailController = TextEditingController();

    emailController.addListener(() {
      final email = emailController.text;
      final isValid = Validator.validateEmail(email);
      emailError.value = isValid;
    });

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void onPressBack() {
    Get.back();
  }

  Future<void> onPressedNext() async {
  //   if (emailError.value != null) {
  //     return;
  //   }
  //   loading(true);
  //   final response = await ;
  //   loading(false);
  }
}
