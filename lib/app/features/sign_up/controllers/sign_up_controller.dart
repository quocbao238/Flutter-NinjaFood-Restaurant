import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignUpController extends BaseController {
  final AuthController authController;

  SignUpController({required this.authController});

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  Rxn<String?> emailError = Rxn<String?>(null);
  Rxn<String?> passwordError = Rxn<String?>(null);
  Rxn<String?> nameError = Rxn<String?>(null);

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();

    emailController.addListener(() {
      final email = emailController.text;
      emailError.value = Validator.validateEmail(email);
    });

    passwordController.addListener(() {
      final password = passwordController.text;
      passwordError.value = Validator.validatePassword(password);
    });

    nameController.addListener(() {
      final name = nameController.text;
      nameError.value = Validator.validateName(name);
    });
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  Future<void> onPressedCreateAccount() async {
    if (emailError.value != null || passwordError.value != null || nameError.value != null) {
      return;
    }
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    loading(true);
    await authController.registerWithEmailAndPassword(email: email, password: password, fullName: name).then((value) {
      if (value) Get.offAllNamed(AppRouteProvider.signupProcessScreen);
    });
    loading(false);
  }

  void onPressedAlreadyHaveAnAccount() {
    Get.toNamed(AppRouteProvider.signinScreen);
  }
}
