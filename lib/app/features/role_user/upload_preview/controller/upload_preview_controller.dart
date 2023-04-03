import 'dart:io';

import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/db_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'uploadPreviewController';

class UploadPreviewController extends BaseController {
  final AuthController authController;
  final DatabaseController dbController;
  final CloudStorageController cloudStorageController;

  UploadPreviewController(
      {required this.authController, required this.dbController, required this.cloudStorageController});

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
    final currentUser = authController.currentUser;
    if (currentUser == null) return;


    loading(true);
    final urlCallBack = await cloudStorageController.updateUserPhoto(imageFile, currentUser.uid);
    if (urlCallBack == null) {
      loading(false);
      return;
    }


    final newUser = currentUser.copyWith(photoUrl: urlCallBack);

    final response = await dbController.updateUser(newUser);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
      Get.toNamed(AppRouteProvider.setLocationScreen);
    });

    loading(false);
  }
}
