import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/splash/controllers/theme_controller.dart';

class SignInController extends BaseController {
  final ThemeController themeController;

  SignInController({required this.themeController});

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

  void onPressedLogin() {
    // themeController.changeTheme();
  }

  void onPressedForgotPassword() {}
}
