import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';

class UploadPreviewController extends BaseController {
  final AuthProvider authProvider;

  UploadPreviewController({required this.authProvider});

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

  void onPressedRemovePhoto() {}

  void onPressedNext() {
    Get.toNamed(AppRouteProvider.setLocationScreen);
  }
}
