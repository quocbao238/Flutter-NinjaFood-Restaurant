import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/services.dart';

class SplashController extends BaseController {
  final SharedPreferencesService sharedPreferencesService;

  SplashController({required this.sharedPreferencesService});

  @override
  void onInit() async {
    super.onInit();
    checkFirstTimeInstallApp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkFirstTimeInstallApp() async {
    await Future.delayed(Duration(seconds: 5));
    final firstTimeOpenAppKey = (sharedPreferencesService
            .getBool(SharedPreferencesKey.firstTimeOpenAppKey) ??
        true);

    if (!firstTimeOpenAppKey) {
      sharedPreferencesService.writeBool(
          SharedPreferencesKey.firstTimeOpenAppKey, true);
      Get.offAndToNamed(AppRouteProvider.onboardScreen);
      return;
    }
    Get.offAndToNamed(AppRouteProvider.signinScreen);
  }
}
