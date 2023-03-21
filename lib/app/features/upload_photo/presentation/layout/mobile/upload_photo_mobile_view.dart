import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/upload_photo/controller/upload_photo_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class UploadPhotoMobileView extends GetView<UploadPhotoController> {
  const UploadPhotoMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    AppText.headlineLarge(text: 'UploadPhotoScreen_Title'.tr),
                    AppText.bodySmall(text: 'UploadPhotoScreen_Description'.tr)
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(),
                    )
                  ],
                ),
              ],
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.only(bottom: AppGapSize.large),
            child: AppButton.min(
              title: 'UploadPhotoScreen_Next'.tr,
              onPressed: controller.onPressedNext,
            ),
          ),
        ],
      ),
    );
  }
}
