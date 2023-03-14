import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';
import 'package:ninjafood/app/theme/theme.dart';
import 'controllers/demo_controller.dart';

class DemoScreen extends GetView<DemoController> {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppText.displayLarge(text: 'Food Ninja'),
            AppText.displayMedium(text: 'AppText.displayMedium'),
            AppText.displaySmall(text: 'AppText.displaySmall'),
            AppText.headlineLarge(text: 'AppText.headlineLarge'),
            AppText.headlineMedium(text: 'AppText.headlineMedium'),
            AppText.headlineSmall(text: 'AppText.headlineSmall'),
            AppText.bodyLarge(text: 'AppText.bodyLarge'),
            AppText.bodyMedium(text: 'AppText.bodyMedium'),
            AppText.bodySmall(text: 'AppText.bodySmall'),
            AppPadding.small(),
            AppButton.min(title: 'AppButton min', onPressed: () {}),
            AppPadding.small(),
            AppButton.max(title: 'AppButton max', onPressed: () {}),
            AppPadding.small(),
            AppErrorWidget(message: 'App Error Widget'), AppPadding.small(),
            AppSizeScale(
                backgroundColor: ThemeColors.primaryColor,
                ratioHeight: 0.1,
                ratioWidth: 0.5,
                child: Center(
                    child: AppText.bodySmall(text: 'AppSizeScale 0.5 - 0.1'))),
            AppPadding.small(),
            AppSizeScale(
                backgroundColor: ThemeColors.primaryColor,
                ratioHeight: 0.2,
                ratioWidth: 0.8,
                child: Center(
                    child: AppText.bodySmall(text: 'AppSizeScale 0.8 - 0.2'))),
            AppPadding.small(),
            AppSizeScale(
                backgroundColor: ThemeColors.primaryColor,
                ratioHeight: 0.3,
                ratioWidth: 1,
                child: Center(
                    child: AppText.bodySmall(text: 'AppSizeScale 1 - 0.3'))),

            AppPadding.small(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: AppButton.max(
                onPressed: () => controller.onPressedOnBoardScreen(),
                title: 'Push to OnBoardScreen',
              ),
            )
          ],
        ),
      ),
    );
  }
}
