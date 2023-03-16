import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends BaseController {
  late final SharedPreferences _prefs;

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
    _prefs = await SharedPreferences.getInstance();
    final isSecondOpenedApp = _prefs.getBool('enbaleOnboard') ?? false;

    if (!isSecondOpenedApp) {
      _prefs.setBool('enbaleOnboard', true);
      Future.delayed(Duration(seconds: 5))
          .then((_) => Get.offAndToNamed(AppRouteProvider.onboardScreen));
      return;
    }

    Future.delayed(Duration(seconds: 5))
        .then((_) => Get.offAndToNamed(AppRouteProvider.signupScreen));
  }
}
