import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/file_helper.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
const _logName = 'UploadPhotoController';

class UploadPhotoController extends BaseController {
  final ConsoleService console = ConsoleService.instance;

  void onPressBack() {
    Get.back();
  }

  Future<void> onPressedFromGallery() async {
    final image = await FileHelper.pickImage();
    if (image != null) Get.toNamed(AppRouteProvider.uploadPreviewScreen, arguments: image);
  }

  Future<void> onPressedTakePhoto() async {
    final image = await FileHelper.takePhoto();
    if (image != null) Get.toNamed(AppRouteProvider.uploadPreviewScreen, arguments: image);
  }

  void onPressedSkip() {
    Get.toNamed(AppRouteProvider.setLocationScreen);
  }
}
