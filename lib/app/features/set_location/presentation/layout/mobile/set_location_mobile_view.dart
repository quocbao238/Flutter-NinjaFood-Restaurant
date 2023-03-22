import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/set_location/controller/set_location_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SetLocationMobileView extends GetView<SetLocationController> {
  const SetLocationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      onPressBackButton: controller.onPressBack,
      body: Column(),
    );
  }
}
