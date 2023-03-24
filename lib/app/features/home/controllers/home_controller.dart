import 'package:get/get.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class HomeController extends GetxController {
  final AuthController authController;

  HomeController({required this.authController});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onPressedLogout() async {
    await authController.signOut().then((value) {
      if (value) Get.offAllNamed(AppRouteProvider.signinScreen);
    });
  }
}
