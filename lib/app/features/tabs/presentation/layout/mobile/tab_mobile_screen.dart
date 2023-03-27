import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/home/presentation/home_screen.dart';
import 'package:ninjafood/app/features/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/tabs/presentation/layout/mobile/widgets/drawer/drawer_mobile_view.dart';

class TabsMobileScreen extends GetView<TabsController> {
  const TabsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? null : ThemeColors.menuLightColor,
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
        shadowLayer1Color: darken(Color(0xFF7F67BE)),
        shadowLayer2Color: darken(Color(0xFFFFD8E4)),
        borderRadius: 32.0,
        showShadow: true,
        angle: -8.0,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}

Color darken(Color color) {
  if (!Get.isDarkMode) return color;
  final amount  = 0.4;
  final hsl = HSLColor.fromColor(color);
  final darkHsl = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return darkHsl.toColor();
}
