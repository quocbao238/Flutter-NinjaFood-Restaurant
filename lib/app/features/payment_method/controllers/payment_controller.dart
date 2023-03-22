import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';

class PaymentController extends BaseController {
  final AuthProvider authProvider;

  PaymentController({required this.authProvider});

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
    Get.toNamed(AppRouteProvider.uploadPhotoScreen);
    // Get.find<ThemeService>().toggleTheme();
  }
}
