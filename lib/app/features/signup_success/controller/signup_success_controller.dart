import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignupSuccessController extends BaseController {
  final AuthController authController;

  SignupSuccessController({required this.authController});

  @override
  void onInit() {
    super.onInit();
    asyncFuture();
  }

  asyncFuture() async {
    await Future.delayed(Duration(seconds: 8));
    Get.offAllNamed(AppRouteProvider.homeScreen);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedNext() {
    Get.offAllNamed(AppRouteProvider.homeScreen);
  }
}
