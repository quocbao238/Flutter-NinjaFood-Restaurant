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

  Future<void> onPressedCreateAccount() async {
    loading(true);
   final isSinged  = await authProvider.signUp(email: 'bao_dev@gmail.com', password: '12345678',name: 'Bao');
    loading(false);
   if(isSinged)
     Get.offAllNamed(AppRouteProvider.homeScreen);

  }


  void onPressedAlreadyHaveAnAccount() {
    Get.toNamed(AppRouteProvider.signinScreen);
  }
}
