

import 'package:get/get.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';

class HomeController extends GetxController {
  final AuthProvider authProvider;
  HomeController({required this.authProvider});

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
    await authProvider.logout().then((value) {
      if (value) {
        Get.offAllNamed(AppRouteProvider.signinScreen);
      }
    });
  }


}