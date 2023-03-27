import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/set_location/controller/set_location_controller.dart';

class BoxLocation extends StatelessWidget {
  final VoidCallback onPressSetLocation;

  const BoxLocation({super.key, required this.onPressSetLocation});

  @override
  Widget build(BuildContext context) {
    final setLocationController = Get.find<SetLocationController>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(-4, 4),
          ),
          BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.2), blurRadius: 8, offset: Offset(4, -4))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppPadding.medium(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppIcons.yourLocation(),
                AppPadding.small(),
                Expanded(
                  child: Obx(() => AppText.bodyLarge(
                      text: (setLocationController.addressLocation.value ?? 'SetLocationScreen_YourLocation').tr,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
          AppPadding.medium(
            child: ElevatedButton(
              onPressed: onPressSetLocation,
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(0.4)),
                  ),
              child: SizedBox(
                height: kToolbarHeight,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: AppText.bodyMedium(
                    textAlign: TextAlign.center,
                    text: 'SetLocationScreen_SetLocation'.tr,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
