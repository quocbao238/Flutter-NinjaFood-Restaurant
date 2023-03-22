import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/set_location/controller/set_location_controller.dart';

class SetLocationMobileView extends GetView<SetLocationController> {
  const SetLocationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      onPressBackButton: controller.onPressBack,
      body: Column(),
    );
  }
}
