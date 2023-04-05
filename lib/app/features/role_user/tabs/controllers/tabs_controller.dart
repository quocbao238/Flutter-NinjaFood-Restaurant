import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/tabs/infrastructure/models/menu_models.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'TabsController';

class TabsController extends BaseController {
  final AuthController authController;
  final ThemeController themeController;

  TabsController({
    required this.authController,
    required this.themeController,
  });

  final zoomDrawerController = ZoomDrawerController();

  List<MenuItem> menuItems = MenuItem.listMenu;

  List<Widget> screens = MenuItem.listMenu
      .where((element) => element.screen != null)
      .toList()
      .map((e) => e.screen!)
      .toList();

  Rx<MenuItem> currentMenuItem = MenuItem.listMenu[3].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }

  void onPressedMenuItem(MenuItem menuItem) {
    switch (menuItem.menuType) {
      case MenuType.settings:
        _onPressedSettings();
        break;
      case MenuType.logout:
        _onPressedLogout();
        break;
      case MenuType.about:
        _onPressedAbout();
        break;
      case MenuType.changeTheme:
        _onPressedChangeTheme();
        break;
      default:
        currentMenuItem.value = menuItem;
        toggleDrawer();
    }
  }

  void _onPressedSettings() {}

  void _onPressedAbout() {}

  void _onPressedChangeTheme() {
    themeController.toggleTheme();
  }

  Future<void> _onPressedLogout() async {
    final response = await authController.signOut();
    response.fold(
      (l) => handleFailure(_logName, l),
      (r) => Get.offAllNamed(AppRouteProvider.splashScreen),
    );
  }

  Future<void> onPressedNotification() async {
  }
}
