import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final tabsController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.patternWithDrawer(
      onPressDrawer: () {
        tabsController.toggleDrawer();
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppPadding.regular(),
            Obx(() {
              final currentUser = authController.currentUser;
              if (currentUser == null) return SizedBox.shrink();
              return Column(
                children: [
                  AppText.bodyMedium(text: 'Name: ${currentUser.firstName} ${currentUser.lastName}'),
                  AppText.bodyMedium(text: 'Email: ${currentUser.email}'),
                  AppText.bodyMedium(text: 'Phone: ${currentUser.phoneNumber}'),
                  AppPadding.medium(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          currentUser.photoUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            AppPadding.medium(
              child: Obx(() {
                final isVerified = authController.authUser.value?.emailVerified ?? false;
                return AppButton.max(
                    onPressed: isVerified
                        ? null
                        : () {
                            controller.onPressedVerifyEmail();
                          },
                    title: isVerified ? 'Email Verified' : 'Verify Email');
              }),
            ),
            AppButton.min(
              title: 'Logout',
              onPressed: () async {
                controller.onPressedLogout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
