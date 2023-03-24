import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/global_controller/local_storage_controller/local_storage_key.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SplashController extends BaseController {
  final LocalStorageController localStorageController;

  SplashController({required this.localStorageController});

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
    await Future.delayed(Duration(seconds: 2));

    final secondTimeOpenApp = localStorageController.getBool(LocalStorageKey.secondTimeOpenApp);

    if (secondTimeOpenApp == null || secondTimeOpenApp == false) {
      localStorageController.writeBool(LocalStorageKey.secondTimeOpenApp, true);
      Get.offAndToNamed(AppRouteProvider.onboardScreen);
      return;
    }

    Get.offAndToNamed(AppRouteProvider.signinScreen);
  }
}
