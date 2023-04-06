import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends BaseController {
  late final SharedPreferences _sharedPreferences;


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
    _sharedPreferences = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));
    final secondTimeOpenApp = _sharedPreferences.getBool(LocalStorageKey.secondTimeOpenApp);
    if (secondTimeOpenApp == null || secondTimeOpenApp == false) {
      _sharedPreferences.setBool(LocalStorageKey.secondTimeOpenApp, true);
      Get.offAndToNamed(AppRouteProvider.onboardScreen);
      return;
    }

    Get.offAndToNamed(AppRouteProvider.signinScreen);
  }
}
