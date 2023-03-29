import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/upload_photo/controller/upload_photo_controller.dart';
import 'package:ninjafood/app/features/upload_photo/presentation/layout/mobile/widgets/box_photo.dart';

class UploadPhotoMobileView extends GetView<UploadPhotoController> {
  const UploadPhotoMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      onPressBackButton: controller.onPressBack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: AppText.headlineSmall(
                        fontWeight: FontWeight.bold, textAlign: TextAlign.start, text: 'UploadPhotoScreen_Title'.tr)),
                AppPadding.medium(
                    child: AppText.bodyMedium(
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        text: 'UploadPhotoScreen_Description'.tr)),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                  child: BoxPhoto(
                    iconPhoto: AppIcons.gallery(),
                    textPhoto: 'Form Gallery',
                    onPressed: controller.onPressedFromGallery,
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                  child: BoxPhoto(
                    iconPhoto: AppIcons.camera(),
                    textPhoto: 'Take Photo',
                    onPressed: controller.onPressedTakePhoto,
                  ),
                ),
              ],
            ),
          ),
          AppPadding.regular(
            child: AppButton.max(title: 'Skip_Button'.tr, onPressed: controller.onPressedSkip),
          ),
        ],
      ),
    );
  }
}
