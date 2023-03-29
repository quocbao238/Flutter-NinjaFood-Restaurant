import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SuccessNotificationController extends BaseController {
  final AuthController authController;

  SuccessNotificationController({required this.authController});

  @override
  void onInit() {
    super.onInit();
    // asyncFuture();
  }

  // asyncFuture() async {
  //   await Future.delayed(Duration(seconds: 8));
  //   Get.offAllNamed(AppRouteProvider.tabScreen);
  // }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedBack() {
    Get.offAllNamed(AppRouteProvider.signinScreen);
  }
}
