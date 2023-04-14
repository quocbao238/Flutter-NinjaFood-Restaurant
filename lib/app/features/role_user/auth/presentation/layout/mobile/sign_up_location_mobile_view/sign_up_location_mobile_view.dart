import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/layout/mobile/sign_up_location_mobile_view/sign_up_location_box.dart';

class SignUpLocationMobileView extends GetView<SignUpProcessController> {
  const SignUpLocationMobileView({super.key});

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
                      text: 'SetLocationScreen_Title'.tr,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  AppPadding.medium(
                    child: AppText.bodyMedium(
                      text: 'SetLocationScreen_Description'.tr,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  AppPadding.medium(
                    child: Center(
                      child: BoxLocation(
                        onPressSetLocation: controller.onPressedSetLocation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppPadding.regular(
              child: Obx(() {
                final title = controller.addressLocation.value == null ? 'Skip_Button' : 'Next_Button';
                return AppButton.max(title: title.tr, onPressed: controller.onPressedNextButtonLocation);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
