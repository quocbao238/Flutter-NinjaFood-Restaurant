import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.patternWithDrawer(
      onPressDrawer: () => tabsController.toggleDrawer(),
      body: Center(
        child: Text('CardScreen'),
      ),
    );
  }
}
