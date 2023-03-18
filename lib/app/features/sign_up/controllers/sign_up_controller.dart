import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/theme/theme_service.dart';

class SignUpController extends BaseController {
  final ThemeService themeService;

  SignUpController({required this.themeService});

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
    themeService.toggleTheme();
  }

  void onPressedAlreadyHaveAnAccount() {
    Get.toNamed(AppRouteProvider.signinScreen);
  }
}
