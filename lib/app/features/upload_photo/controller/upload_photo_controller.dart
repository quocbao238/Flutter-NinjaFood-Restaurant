import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class UploadPhotoController extends BaseController {
  final AuthController authController;

  UploadPhotoController({required this.authController});

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
  }

  void onPressedTakePhoto() {}

  void onPressedNext() {
    Get.toNamed(AppRouteProvider.uploadPreviewScreen);
  }
}
