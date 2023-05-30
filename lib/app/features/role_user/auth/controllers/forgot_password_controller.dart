import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/auth_service/auth_service.dart';

class ForgotPassWordController extends BaseController {
  final AuthService authService = AuthService.instance;
  late final TextEditingController emailController;
  Rxn<String?> emailError = Rxn<String?>(null);

  @override
  void onInit() {
    emailController = TextEditingController();
    emailController.addListener(() => checkValidEmail());
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }



  void onPressBack() => Get.back();

  Future<void> onPressedSend() async {
    if (!checkValidEmail()) return;
    await authService.sendEmailResetPassword(email: emailController.text).then(
        (response) => response.fold(
            (l) => handleFailure("ForgotPassWordController", l),
            (r) => Get.toNamed(AppRouteProvider.successNotificationScreen)));
  }

  bool checkValidEmail() {
    final email = emailController.text;
    final isValid = Validator.validateEmail(email);
    emailError.value = isValid;
    return isValid == null;
  }

  void onPressedBackSuccess() => Get.offAllNamed(AppRouteProvider.signInScreen);
}
