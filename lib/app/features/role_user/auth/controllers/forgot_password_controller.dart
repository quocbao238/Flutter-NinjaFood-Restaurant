import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';


class ForgotPassWordController extends BaseController {

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

  void onPressedSend(){
    Get.toNamed(AppRouteProvider.successNotificationScreen);
  }

  void onPressedBackSuccess() {
    Get.offAllNamed(AppRouteProvider.signinScreen);
  }

}
