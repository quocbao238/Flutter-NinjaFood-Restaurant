import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/auth_service/auth_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'SignInController';

class SignInController extends BaseController {
  final authService = AuthService.instance;
  final dbService = DatabaseService.instance;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  Rxn<String?> emailError = Rxn<String?>();
  Rxn<String?> passwordError = Rxn<String?>();

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

  bool _checkValidEmailAndPassword() {
    final email = emailController.text;
    final password = passwordController.text;
    emailError.value = Validator.validateEmail(email);
    passwordError.value = Validator.validatePassword(password);
    return emailError.value == null && passwordError.value == null;
  }

  void _onCheckFirstTimeLogin(
      {required UserCredential userCredential, required String createType}) {
    if (userCredential.additionalUserInfo?.isNewUser == true) {
      _createInsertUserDatabase(
          firebaseAuthUser: userCredential.user!, createType: createType);
      return;
    }
    Get.offAllNamed(AppRouteProvider.tabScreen);
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

  Future<void> onPressedSocialFacebook() async {
    loading.value = true;
    final response = await authService.registerWithFacebook();
    await response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (UserCredential? userCredential) {
      if (userCredential != null)
        _onCheckFirstTimeLogin(
            userCredential: userCredential,
            createType: UserCreateType.facebook);
    });
    loading.value = false;
  }

  Future<void> onPressedSocialGoogle() async {
    loading.value = true;
    final response = await authService.registerWithGoogle();
    await response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (UserCredential? userCredential) {
      if (userCredential != null)
        _onCheckFirstTimeLogin(
            userCredential: userCredential, createType: UserCreateType.google);
    });

    loading.value = false;
  }

  Future<void> onPressedLogin() async {
    if (!_checkValidEmailAndPassword()) return;

    final email = emailController.text;
    final password = passwordController.text;
    loading.value = true;
    final response =
        await authService.loginWithEmail(email: email, password: password);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (r) {
      Get.offAllNamed(AppRouteProvider.tabScreen);
    });
    loading.value = false;
  }

  void onPressedSignUp() {
    Get.offAllNamed(AppRouteProvider.signupScreen);
  }

  void onPressedForgotPassword() {
    Get.toNamed(AppRouteProvider.forgotPasswordScreen);
  }
}
