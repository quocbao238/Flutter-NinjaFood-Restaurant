import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/widgets.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class AppBarHomeWidget extends GetView<TabsController> {
  const AppBarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Obx(() {
                final homeController = Get.find<HomeController>();
                final isViewTypeNormal =
                    homeController.homeViewType.value == HomeViewType.normal;
                if (!isViewTypeNormal) {
                  return AppButtonBack(onPressed: () {
                    homeController.onPressedBackToNormalHome();
                  });
                }
                return AppButtonDrawer(
                    onPressed: () => controller.toggleDrawer());
              }),
              const Expanded(
                child: AppPadding.medium(
                    child: AppText.headlineSmall(text: 'Ninja Food')),
              ),
              AppButtonNotification(
                  onPressed: () => controller.onPressedNotification()),
            ],
          ),
          AppPadding(
              padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
              child: ProductSearchBar()),
          AppPadding.small()
        ],
      ),
    );
  }
}
