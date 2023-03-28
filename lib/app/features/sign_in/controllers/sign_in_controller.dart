import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'SignInController';

class SignInController extends BaseController {
  final AuthController authController;

  SignInController({required this.authController});

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

  void onPressedSocialFacebook() {
    // final themeService = Get.find<ThemeController>();
    // themeService.toggleTheme();
  }

  Future<void> onPressedSocialGoogle() async {
    loading.value = true;
    final response = await authController.registerWithGoogle();
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
      Get.offAllNamed(r
          ? AppRouteProvider.signupProcessScreen
          : AppRouteProvider.tabScreen);
    });
    loading.value = false;
  }

  // Future<void> onPressedSocialApple() async {
  //   loading.value = true;
  //   final response = await authController.registerWithApple();
  //   await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
  //     Get.offAllNamed(r
  //         ? AppRouteProvider.signupProcessScreen
  //         : AppRouteProvider.tabScreen);
  //   });
  //   loading.value = false;
  // }

  Future<void> onPressedLogin() async {
    if (emailError.value != null || passwordError.value != null) {
      return;
    }

    final email = emailController.text;
    final password = passwordController.text;
    loading.value = true;
    final response = await authController.loginWithEmailAndPassword(email: email, password: password);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
      Get.offAllNamed(AppRouteProvider.tabScreen);
    });
    loading.value = false;
  }

  void onPressedSignUp() {
    Get.toNamed(AppRouteProvider.signupScreen);
  }

  void onPressedForgotPassword() {
    authController.resetPassword(email: 'baobondev@gmail.com'.trim()).then((value) {
      value.fold((l) => handleFailure('SignInController', l, showDialog: true), (r) {
        Get.snackbar('Reset password', 'Reset password success');
      });
    });
  }
}
