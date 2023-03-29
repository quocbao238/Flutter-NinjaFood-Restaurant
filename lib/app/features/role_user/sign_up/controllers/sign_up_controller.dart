import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'SignUpController';

class SignUpController extends BaseController {
  final AuthController authController;

  SignUpController({required this.authController});

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  Rxn<String?> emailError = Rxn<String?>(null);
  Rxn<String?> passwordError = Rxn<String?>(null);
  Rxn<String?> confirmPasswordError = Rxn<String?>(null);

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    emailController.addListener(() {
      final email = emailController.text;
      emailError.value = Validator.validateEmail(email);
    });

    passwordController.addListener(() {
      final password = passwordController.text;
      passwordError.value = Validator.validatePassword(password);
    });

    confirmPasswordController.addListener(() {
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;
      confirmPasswordError.value = Validator.validatePasswordConfirm(password, confirmPassword);
    });


    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  Future<void> onPressedCreateAccount() async {
    if (emailError.value != null || passwordError.value != null || confirmPasswordError.value != null) {
      return;
    }
    final email = emailController.text;
    final password = passwordController.text;
    loading(true);
    final response = await authController.registerWithEmailAndPassword(email: email, password: password);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (r) => Get.offAllNamed(AppRouteProvider.signupProcessScreen));
    loading(false);
  }

  void onPressedAlreadyHaveAnAccount() {
    Get.offAllNamed(AppRouteProvider.signinScreen);
  }
}
