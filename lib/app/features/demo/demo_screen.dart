import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';
import 'controllers/demo_controller.dart';

class DemoScreen extends GetView<DemoController> {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppText.displayLarge(text: 'Food Ninja'),
            AppText.displayMedium(text: 'Food Ninja'),
            AppText.displaySmall(text: 'Food Ninja'),
            AppText.headlineLarge(text: 'Food Ninja'),
            AppText.headlineMedium(text: 'Food Ninja'),
            AppText.headlineSmall(text: 'Food Ninja'),
            AppText.bodyLarge(text: 'Food Ninja'),
            AppText.bodyMedium(text: 'Food Ninja'),
            AppText.bodySmall(text: 'Food Ninja'),
            SizedBox(height: 56),
            AppButton.min(
              title: 'Login min',
              onPressed: () {},
            ),
            SizedBox(height: 56),
            AppButton.max(
              title: 'Login max',
              onPressed: () {},
            ),

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
