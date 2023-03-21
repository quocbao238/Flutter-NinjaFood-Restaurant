import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/upload_photo/controller/upload_photo_controller.dart';
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
                  textAlign: TextAlign.start,
                  text: 'UploadPhotoScreen_Title'.tr)),
          AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.medium, vertical: AppGapSize.small),
              child: AppText.bodySmall(
                  textAlign: TextAlign.start,
                  text: 'UploadPhotoScreen_Description'.tr)),
          SizedBox(
            height: 129,
            width: MediaQuery.of(context).size.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  AppPadding(
                      padding: AppEdgeInsets.only(
                          top: AppGapSize.large, bottom: AppGapSize.small),
                      child: AppIcons.gallery()),
                  AppText.bodyLarge(text: 'Gallery')
                ],
              ),
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
