import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'HomeController';

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

  void onPressedLogout() async {
    final response = await authController.signOut();
    response.fold(
        (l) => handleFailure(_logName, l, showDialog: true), (r) => Get.offAllNamed(AppRouteProvider.signinScreen));
  }

  void onPressedVerifyEmail() async {
    final response = await authController.sendEmailVerification();
    response.fold(
        (l) => handleFailure(_logName, l, showDialog: true), (r) => Get.snackbar('Success', 'Email verification sent'));
  }
}
