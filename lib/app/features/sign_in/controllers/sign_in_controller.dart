import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/services.dart';

class SignInController extends BaseController {
  final AuthProvider authProvider;

  SignInController({required this.authProvider});

  @override
  void onInit() {
    super.onInit();

    console.showWarning('SignInController', 'onInit');
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedSocialFacebook() {}

  void onPressedSocialGoogle() {}

  void onPressedLogin() {
    this.loading.value = true;
     Future.delayed(Duration(seconds: 2), () {
      this.loading.value = false;
    });
  }


  void onPressedSignUp() {
    Get.toNamed(AppRouteProvider.signupScreen);
  }

  void onPressedForgotPassword() {}
}
