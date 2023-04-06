import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';

class PaymentController extends BaseController {
  // final AuthController authController;

  // PaymentController({required this.authController});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressBack() {
    Get.back();
  }

  void onPressedPayPal() {}

  void onPressedVisa() {}

  void onPressedPayoneer() {}

  void onPressedNext() {
    // final currentUser = authController.currentUser;
    // if (currentUser?.photoUrl?.isNotEmpty ?? false) {
    //    Get.toNamed(AppRouteProvider.setLocationScreen);
    //    return;
    // }
    // Get.toNamed(AppRouteProvider.uploadPhotoScreen);
  }
}
