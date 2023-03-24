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
  }

  asyncFuture() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRouteProvider.homeScreen);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedTryOrder() {}
}
