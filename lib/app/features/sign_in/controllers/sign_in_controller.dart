import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignInController extends BaseController {
  final AuthProvider authProvider;

  SignInController({required this.authProvider});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedSocialFacebook() {}

  void onPressedSocialGoogle() {}

  void onPressedLogin() {}

  void onPressedSignUp() {
    Get.toNamed(AppRouteProvider.signupScreen);
  }

  void onPressedForgotPassword() {}
}
