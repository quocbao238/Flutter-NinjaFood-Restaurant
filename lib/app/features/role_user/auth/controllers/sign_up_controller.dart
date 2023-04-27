import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/auth_service/auth_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'SignUpController';

class SignUpController extends BaseController {
  final AuthService authService = AuthService.instance;
  final DatabaseService dbService = DatabaseService.instance;

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
      confirmPasswordError.value =
          Validator.validatePasswordConfirm(password, confirmPassword);
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

  bool _checkValidEmailAndPassword() {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    emailError.value = Validator.validateEmail(email);
    passwordError.value = Validator.validatePassword(password);
    confirmPasswordError.value =
        Validator.validatePasswordConfirm(password, confirmPassword);
    return emailError.value == null &&
        passwordError.value == null &&
        confirmPasswordError.value == null;
  }

  Future<void> onPressedCreateAccount() async {
    if (!_checkValidEmailAndPassword()) return;

    final email = emailController.text;
    final password = passwordController.text;
    loading(true);
    final response =
        await authService.registerWithEmail(email: email, password: password);
    await response.fold(
        (l) => handleFailure(_logName, l, showDialog: true),
        (r) => _createInsertUserDatabase(
            firebaseAuthUser: r.user!, createType: UserCreateType.email));
    loading(false);
  }

  Future<void> _createInsertUserDatabase(
      {required User firebaseAuthUser, required String createType}) async {
    final newUser = UserModel.createUserByAuthUser(
        authUser: firebaseAuthUser, createType: createType);
    final response = await dbService.insertUser(userModel: newUser);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (r) {
      Get.offAllNamed(AppRouteProvider.signupProcessScreen);
    });
  }

  void onPressedAlreadyHaveAnAccount() {
    Get.offAllNamed(AppRouteProvider.signInScreen);
  }
}
