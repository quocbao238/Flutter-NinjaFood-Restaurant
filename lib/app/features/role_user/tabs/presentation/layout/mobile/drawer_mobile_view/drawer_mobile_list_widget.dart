part of 'drawer_mobile_view.dart';


class DrawerListWidget extends GetView<TabsController> {
  const DrawerListWidget({Key? key}) : super(key: key);

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
                      child: DrawerItemWidget(
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

                  return DrawerItemWidget(
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
