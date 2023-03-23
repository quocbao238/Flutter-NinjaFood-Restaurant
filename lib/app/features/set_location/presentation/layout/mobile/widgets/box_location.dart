import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxLocation extends StatelessWidget {
  final VoidCallback onPressSetLocation;
  const BoxLocation({super.key, required this.onPressSetLocation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 147,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.medium, vertical: AppGapSize.medium),
              child: Row(
                children: [
                  AppIcons.yourLocation(),
                  AppText.bodySmall(
                    text: 'SetLocationScreen_YourLocation'.tr,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                  horizontal: AppGapSize.medium, vertical: AppGapSize.small),
              child: ElevatedButton(
                onPressed: onPressSetLocation,
                child: SizedBox(
                  height: kToolbarHeight,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: AppText.bodySmall(
                      text: 'SetLocationScreen_SetLocation'.tr,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
