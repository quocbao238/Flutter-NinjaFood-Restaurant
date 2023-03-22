import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/upload_preview/controller/upload_preview_controller.dart';
import 'package:ninjafood/app/features/upload_preview/presentation/layout/mobile/widgets/photo_preview.dart';

class UploadPreviewMobileView extends GetView<UploadPreviewController> {
  const UploadPreviewMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      onPressBackButton: controller.onPressBack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.small),
            child: AppText.headlineSmall(
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                text: 'Upload Your Photo Profile'),
          ),
          AppPadding.medium(
            child: AppText.bodyMedium(
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                text:
                    'This data will be displayed in your account profile for security'),
          ),
          Center(
              child: AppPadding(
                  padding: AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.medium,
                      vertical: AppGapSize.large),
                  child: PhotoPreview(
                    removePhoto: controller.onPressedRemovePhoto,
                  ))),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.veryLarge),
            child: AppButton.max(
              title: 'Next'.tr,
              onPressed: controller.onPressedNext,
            ),
          )
        ],
      ),
    );
  }
}
