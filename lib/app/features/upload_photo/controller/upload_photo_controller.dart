import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/theme/theme_service.dart';

class UploadPhotoController extends BaseController {
  final AuthProvider authProvider;

  UploadPhotoController({required this.authProvider});

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

  void onPressedFromGallery() {
    Get.find<ThemeService>().toggleTheme();
  }

  void onPressedTakePhoto() {}

  void onPressedNext() {
    Get.toNamed(AppRouteProvider.uploadPreviewScreen);
  }
}
