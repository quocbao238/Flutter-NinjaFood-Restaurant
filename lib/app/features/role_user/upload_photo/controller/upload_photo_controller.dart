import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ninjafood/app/core/core.dart';
// import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class UploadPhotoController extends BaseController {
  // final AuthController authController;

  // UploadPhotoController({required this.authController});

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

  Future<void> onPressedFromGallery() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        Get.toNamed(AppRouteProvider.uploadPreviewScreen, arguments: image);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print(e);
    }

  }

  Future<void> onPressedTakePhoto() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        Get.toNamed(AppRouteProvider.uploadPreviewScreen, arguments: image);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print(e);
    }

  }

  void onPressedSkip() {
    Get.toNamed(AppRouteProvider.setLocationScreen);
  }
}
