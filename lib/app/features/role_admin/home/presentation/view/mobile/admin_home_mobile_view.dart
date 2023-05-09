import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminHomeMobileView extends StatelessWidget {
  const AdminHomeMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.drawer(title: 'Drawer_Home'.tr),
        body: Container());
  }
}
