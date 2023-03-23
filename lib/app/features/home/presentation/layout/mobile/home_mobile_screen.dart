import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/home/controllers/home_controller.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      body: Center(
        child: AppButton.min(title: 'Logout', onPressed: () async {
          await controller.onPressedLogout();
        }),
      ),
    );
  }
}
