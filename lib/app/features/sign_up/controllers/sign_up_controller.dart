import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignUpController extends BaseController {
  final AuthProvider authProvider;

  SignUpController({required this.authProvider});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<void> onPressedCreateAccount() async {
  //   this.loading.value = true;
  //   await authProvider.signUp(email: 'test1@gmail.com', password: '12345678');
  //   this.loading.value = false;
  // }
  void onPressedCreateAccount() {
    Get.toNamed(AppRouteProvider.signupProcessScreen);
  }

  void onPressedAlreadyHaveAnAccount() {
    Get.toNamed(AppRouteProvider.signinScreen);
  }
}
