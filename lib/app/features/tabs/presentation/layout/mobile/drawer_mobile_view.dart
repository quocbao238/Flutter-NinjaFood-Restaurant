import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/tabs/presentation/layout/mobile/widgets/drawer_item.dart';

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsController = Get.find<TabsController>();
    final currentUser = tabsController.authController.currentUser;
    return SafeArea(
      child: AppSizeScale(
        child: AppPadding(
          padding: AppEdgeInsets.only(
            left: AppGapSize.medium,
            top: AppGapSize.medium,
            bottom: AppGapSize.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSizeScale(
                ratioWidth: 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(900),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.4),
                            blurRadius: 8,
                            offset: Offset(-4, 4),
                          ),
                          BoxShadow(
                              color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.4),
                              blurRadius: 8,
                              offset: Offset(4, -4))
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network(
                          currentUser?.photoUrl ?? '',
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(
                        vertical: AppGapSize.medium,
                      ),
                      child: AppText.bodyLarge(
                        text: (currentUser?.firstName ?? '') + " " + (currentUser?.lastName ?? ''),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    final currentMenuItem = tabsController.currentMenuItem.value;
                    final menuItems = tabsController.menuItems;
                    return AppSizeScale(
                      ratioWidth: 0.5,
                      child: ListView.builder(
                        itemCount: menuItems.length - 1,
                        itemBuilder: (context, index) {
                          final menuItem = menuItems[index];
                          final isSelected = currentMenuItem == menuItem;

                          return DrawerItem(
                            isSelected: isSelected,
                            menuItem: menuItem,
                            onTap: () {
                              tabsController.onPressedMenuItem(menuItem);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
