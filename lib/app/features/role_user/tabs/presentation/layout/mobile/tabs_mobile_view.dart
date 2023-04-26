import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/presentation/tab_drawer_menus.dart';

class TabsMobileView extends GetView<TabsController> {
  const TabsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loading = controller.loading.value;
      return Obx(
        () {
          final currentMenuItem = controller.currentMenuItem.value;
          return AppScaffoldBackgroundImage.splash(
            wrapBodyWithSafeArea: currentMenuItem.index != 1,
            isLoading: loading,
            body: ZoomDrawer(
                controller: controller.zoomDrawerController,
                androidCloseOnBackTap: true,
                style: DrawerStyle.defaultStyle,
                menuScreenTapClose: true,
                menuScreen: DrawerWidget(),
                mainScreen: Obx(() => IndexedStack(
                    index: controller.currentMenuItem.value.index,
                    children: controller.screens)),
                shadowLayer1Color: Get.isDarkMode
                    ? ThemeColors.shadowLayer1ColorDark()
                    : ThemeColors.shadowLayer1Color,
                shadowLayer2Color: Get.isDarkMode
                    ? ThemeColors.shadowLayer2ColorDark()
                    : ThemeColors.shadowLayer2Color,
                borderRadius: 32.0,
                showShadow: true,
                angle: -8.0,
                slideWidth: MediaQuery.of(context).size.width * 0.8),
          );
        },
      );
    });
  }
}
