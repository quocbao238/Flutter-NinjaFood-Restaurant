import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/box_special_deal.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/popular_food.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/popular_menu.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.patternWithDrawer(
      onPressDrawer: () {
        tabsController.toggleDrawer();
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPadding(
              padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.headlineLarge(
                    text: 'Find Your\nFavorite Food',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                  ),
                  AppIcons.notification(),
                ],
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
              child: Row(
                children: [
                  Expanded(
                    child: AppPadding(
                      padding: AppEdgeInsets.only(right: AppGapSize.medium),
                      child: AppTextFormField(
                        hintText: 'What do you want to order?',
                        controller: TextEditingController(),
                      ),
                    ),
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: AppIcons.filter())
                ],
              ),
            ),
            AppPadding.medium(
              child: BoxSpecialDeal(),
            ),
            PopularMenu(),
            PopularFood(),
          ],
        ),
      ),
    );
  }
}
