import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/tabs/infrastructure/models/menu_models.dart';

import 'drawer_item.dart';

class DrawerList extends GetView<TabsController> {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = controller.menuItems;

    return Obx(
          () {
        final currentMenuItem = controller.currentMenuItem.value;
        return AppSizeScale(
            ratioWidth: 0.5,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = menuItems[index];
                  final isSelected = currentMenuItem == menuItem;
                  if (menuItem.menuType == MenuType.logout) {
                    return AppSizeScale(
                      ratioWidth: 0.5,
                      child: DrawerItem(
                        isSelected: false,
                        alignment: Alignment.center,
                        menuItem: menuItems.last,
                        border: Border.all(width: 1, color: Theme
                            .of(context)
                            .colorScheme
                            .primary),
                        backgroundColor: Colors.transparent,
                        onTap: () => controller.onPressedMenuItem(menuItems.last),
                      ),
                    );
                  }

                  return DrawerItem(
                      isSelected: isSelected,
                      menuItem: menuItem,
                      onTap: () => controller.onPressedMenuItem(menuItem)
                  );
                }
            )
        );
      },
    );
  }
}
