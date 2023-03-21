import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/services.dart';

class SignUpProcessController extends BaseController {
  final AuthProvider authProvider;

  SignUpProcessController({required this.authProvider});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedNext() {
    // Get.toNamed(AppRouteProvider.paymentMethodScreen);
    Get.find<ThemeService>().toggleTheme();
  }
}
