import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/upload_preview/controller/upload_preview_controller.dart';
import 'package:ninjafood/app/features/upload_preview/presentation/layout/mobile/widgets/photo_preview.dart';

class UploadPreviewMobileView extends GetView<UploadPreviewController> {
  const UploadPreviewMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        onPressBackButton: controller.onPressBack,
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: AppText.headlineSmall(
                        fontWeight: FontWeight.bold, textAlign: TextAlign.start, text: 'UploadPreviewScreen_Title'.tr),
                  ),
                  AppPadding.medium(
                    child: AppText.bodyMedium(
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        text: 'UploadPreviewScreen_Description'.tr),
                  ),
                  Center(
                      child: AppPadding(
                          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.large),
                          child: PhotoPreview(
                            removePhoto: controller.onPressedRemovePhoto,
                          ))),
                ],
              ),
            ),
            AppPadding.regular(
              child: AppButton.max(
                title: 'UploadPreviewScreen_Next'.tr,
                onPressed: controller.onPressedNext,
              ),
            )
          ],
        ),
      ),
    );
  }
}
