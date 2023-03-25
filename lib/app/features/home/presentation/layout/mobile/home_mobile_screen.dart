import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/home/controllers/home_controller.dart';
import 'package:ninjafood/app/global_controller/db_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return AppScaffoldBackgroundImage.pattern(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton.min(
              title: 'Logout',
              onPressed: () async {
                controller.onPressedLogout();
              },
            ),

            AppPadding.regular(),

            AppText.bodyMedium(text: 'UserModel: ${authController.currentUser.value!.toJson().toString()}'),
          ],
        ),
      ),
    );
  }
}
