import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/services/theme/theme_service.dart';

class SignInController extends BaseController {
  final ThemeService themeService;

  SignInController({required this.themeService});

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
