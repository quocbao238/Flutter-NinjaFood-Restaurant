import 'dart:io';

import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';

const _logName = 'uploadPreviewController';

class SignUpPreviewPhotoController extends BaseController {
  final userController = UserController.instance;
  final cloudStorageService = CloudStorageService.instance;
  late final File imageFile;

  @override
  void onInit() {
    imageFile = Get.arguments as File;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressBack() {
    Get.back();
  }

  void onPressedRemovePhoto() {
    Get.back();
  }

  Future<void> onPressedNext() async {
    final currentUser = userController.getCurrentUser;
    if (currentUser == null) return;
    loading(true);
    final urlCallBack = await cloudStorageService.uploadAvatarImage(
      file: imageFile,
      uid: currentUser.uid,
    );
    if (urlCallBack == null) {
      loading(false);
      return;
    }
    final response = await userController.updateUser(photoUrl: urlCallBack);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
      Get.toNamed(AppRouteProvider.setLocationScreen);
    });

    loading(false);
  }
}
