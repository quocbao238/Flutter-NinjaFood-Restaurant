import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/home/presentation/home_screen.dart';
import 'package:ninjafood/app/features/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/tabs/presentation/layout/mobile/drawer_mobile_view.dart';

class TabsMobileScreen extends GetView<TabsController> {
  const TabsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? null : null,
      body: ZoomDrawer(
        controller: controller.zoomDrawerController,
        style: DrawerStyle.defaultStyle,
        menuScreen: DrawerMobileView(),
        mainScreen:
            Obx(() => IndexedStack(index: controller.currentMenuItem.value.index, children: controller.screens)),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4), blurRadius: 8, offset: Offset(-4, 4)),
          BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.4), blurRadius: 8, offset: Offset(4, -4))
        ],
        shadowLayer1Color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        shadowLayer2Color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        borderRadius: 32.0,
        showShadow: true,
        angle: -8.0,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
