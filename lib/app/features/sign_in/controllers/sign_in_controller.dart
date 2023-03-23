import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignInController extends BaseController {
  final AuthProvider authProvider;

  SignInController({required this.authProvider});

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  Rxn<String?> emailError = Rxn<String?>(null);
  Rxn<String?> passwordError = Rxn<String?>(null);

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(() {
      final email = emailController.text;
      final isValid = Validator.validateEmail(email);
      emailError.value = isValid;
    });

    passwordController.addListener(() {
      final password = passwordController.text;
      passwordError.value = Validator.validatePassword(password);
    });

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onPressedSocialFacebook() {}

  void onPressedSocialGoogle() {}

  Future<void> onPressedLogin() async {
    if (emailError.value != null || passwordError.value != null) {
      return;
    }

    final email = emailController.text;
    final password = passwordController.text;

    loading.value = true;
    final loginSuccess = await authProvider.login(email: email, password: password);
    loading.value = false;

    if (loginSuccess) {
      Get.offAllNamed(AppRouteProvider.homeScreen);
    }
  }

  void onPressedSignUp() {
    Get.toNamed(AppRouteProvider.signupScreen);
  }

  void onPressedForgotPassword() {}
}
