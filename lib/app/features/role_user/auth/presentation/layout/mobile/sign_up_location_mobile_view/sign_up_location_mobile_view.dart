import 'package:flutter/material.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/layout/mobile/sign_up_location_mobile_view/sign_up_location_box.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class SignUpLocationMobileView extends GetView<SignUpProcessController> {
  const SignUpLocationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isPickerLocation.value) {
          return MapLocationPicker(
            showBackButton: false,
            showMoreOptions: false,
            compassEnabled: true,
            currentLatLng: LatLng(10.7735994, 106.6944173),
            bottomCardIcon: Icon(Icons.check, color: Colors.white),
            backButton: Container(
              width: 53,
              height: 45,
              padding: const EdgeInsets.only(left: 8.0),
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                        ThemeColors.backgroundIconColor()),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)))),
                child: const Center(child: AppIcons.back()),
              ),
            ),
            searchHintText: 'SetLocationScreen_Title'.tr,
            mapType: MapType.normal,
            bottomCardColor: ThemeColors.primaryColor,
            apiKey: FlutterConfigPlus.get('GOOGLE_MAPS_API_KEY'),
            onNext: (GeocodingResult? result) {
              controller.onPressedSetLocation(result?.formattedAddress ?? '');
            },
          );
        }

        return AppScaffoldBackgroundImage.pattern(
          isLoading: controller.loading.value,
          appBarWidget: CustomAppBar.back(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppPadding.small(),
                    AppPadding(
                        padding: AppEdgeInsets.symmetric(
                            horizontal: AppGapSize.medium),
                        child: AppText.headlineSmall(
                            text: 'SetLocationScreen_Title'.tr,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start)),
                    AppPadding.medium(
                        child: AppText.bodyMedium(
                            text: 'SetLocationScreen_Description'.tr,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start)),
                    AppPadding.medium(
                      child: Center(
                        child: BoxLocation(
                          onPressSetLocation:
                              controller.onPressedLocationPicker,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: AppPadding.regular(
                  child: Obx(() {
                    final title = controller.addressLocation.value == null
                        ? 'Skip_Button'
                        : 'Next_Button';
                    return AppButton.max(
                        title: title.tr,
                        onPressed: controller.onPressedNextButtonLocation);
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
