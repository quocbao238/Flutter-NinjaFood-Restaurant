import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/upload_photo/controller/upload_photo_controller.dart';
import 'package:ninjafood/app/features/upload_photo/presentation/layout/mobile/widgets/box_photo.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class UploadPhotoMobileView extends GetView<UploadPhotoController> {
  const UploadPhotoMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      onPressBackButton: controller.onPressBack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.medium, vertical: AppGapSize.small),
              child: AppText.headlineLarge(
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  text: 'UploadPhotoScreen_Title'.tr)),
          AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.medium, vertical: AppGapSize.small),
              child: AppText.bodySmall(
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  text: 'UploadPhotoScreen_Description'.tr)),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.small),
            child: BoxPhoto(
              iconPhoto: AppIcons.gallery(),
              textPhoto: 'Form Gallery',
              onPressed: controller.onPressedFromGallery,
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.small),
            child: BoxPhoto(
              iconPhoto: AppIcons.camera(),
              textPhoto: 'Take Photo',
              onPressed: () {},
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.verylarge),
            child: AppButton.max(
              title: 'UploadPhotoScreen_Next'.tr,
              onPressed: controller.onPressedNext,
            ),
          ),
        ],
      ),
    );
  }
}
