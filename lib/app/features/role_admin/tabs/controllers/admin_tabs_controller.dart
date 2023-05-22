import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/models/menu_models.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/auth_service/auth_service.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
import 'package:ninjafood/app/services/language_service/language_service.dart';
import 'package:ninjafood/app/services/theme_service/theme_service.dart';

const _logName = 'TabsController';

class AdminTabsController extends BaseController {
  static TabsController get instance => Get.find<TabsController>();
  final themeService = ThemeService.instance;
  final zoomDrawerController = ZoomDrawerController();
  final authService = AuthService.instance;

  List<MenuItem> menuItems = MenuItem.listAdminMenu;

  List<Widget> screens = MenuItem.listAdminMenu
      .where((element) => element.screen != null)
      .toList()
      .map((e) => e.screen!)
      .toList();

  Rx<MenuItem> currentMenuItem = MenuItem.listAdminMenu.first.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleDrawer() {
    ConsoleService.instance.show(_logName, 'toggleDrawer');
    zoomDrawerController.toggle?.call();
  }

  void onPressedMenuItem(MenuItem menuItem) {

    switch (menuItem.menuType) {
      case MenuType.language:
        _onPressedChangeLanguage();
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
      case MenuType.category:
        _onPressedMenu();
        break;

      default:
        currentMenuItem.value = menuItem;
        toggleDrawer();
    }
  }

  void onChangeToCartScreen() => currentMenuItem(
      menuItems.firstWhere((element) => element.menuType == MenuType.cart));

  void onChangeToHomeScreen() => currentMenuItem.value =
      menuItems.firstWhere((element) => element.menuType == MenuType.home);

  Future<void> _onPressedChangeLanguage() async {
    final currentLocale = Get.locale;
    await showModalBottomSheet(
      context: this.context,
      builder: (ctx) => AppPadding.medium(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.titleMedium(text: 'Drawer_Language_Change'.tr),
            AppPadding.small(),
            ...TranslationService.lstLanguage.entries.map(
              (e) {
                return InkWell(
                  onTap: () {
                    Get.back();
                    TranslationService.updateLocale(Locale(e.key));
                  },
                  child: ListTile(
                    leading: Icon(Icons.language,
                        color: currentLocale!.languageCode == e.key
                            ? ThemeColors.primaryColor
                            : Theme.of(this.context)
                                .textTheme
                                .bodyMedium!
                                .color),
                    title: Text(e.value.tr,
                        style: Theme.of(this.context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                color: currentLocale.languageCode == e.key
                                    ? ThemeColors.primaryColor
                                    : null)),
                  ),
                );
              },
            ).toList()
          ],
        ),
      ),
    );
  }

  Future<void> _onPressedMenu() async => Get.toNamed(AppRouteProvider.adminCategoryScreen);

  void _onPressedAbout() {}

  void _onPressedChangeTheme() => themeService.toggleTheme();

  Future<void> _onPressedLogout() async {
    loading.value = true;
    final response = await authService.signOut();
    response.fold(
      (l) => handleFailure(_logName, l),
      (r) => Get.offAllNamed(AppRouteProvider.splashScreen),
    );
    loading.value = false;
  }
}
