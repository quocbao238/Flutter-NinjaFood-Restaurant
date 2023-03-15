import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5))
        .then((_) => Get.offAndToNamed(AppRouteProvider.onboardScreen));
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
