import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';
import 'sign_up_photo_preview.dart';

class SignUpPhotoPreviewMobileView extends GetView<SignUpProcessController> {
  const SignUpPhotoPreviewMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        appBarWidget: CustomAppBar.back(),
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppPadding.small(),
                  AppPadding(
                    padding:
                        AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: AppText.headlineSmall(
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        text: 'UploadPreviewScreen_Title'.tr),
                  ),
                  AppPadding.medium(
                    child: AppText.bodyMedium(
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        text: 'UploadPreviewScreen_Description'.tr),
                  ),
                  Expanded(
                    child: Center(
                        child: AppPadding.medium(
                            child: SignUpPhotoPreview(
                                removePhoto: controller.onPressedRemovePhoto))),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: AppPadding.regular(
                child: AppButton.max(
                    title: 'Next_Button'.tr,
                    onPressed: controller.onPressedPhotoNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
