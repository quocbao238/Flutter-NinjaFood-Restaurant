import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/mobile_view_type/home_view_type_menu.dart';
import 'package:ninjafood/app/widgets/app_bar_home_widget.dart';

import 'widgets/mobile_view_type/home_view_type_foods.dart';
import 'widgets/mobile_view_type/home_view_type_normal.dart';

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: AppBarHomeWidget(),
      body: Obx(
        () {
          final homeViewType = controller.homeViewType.value;
          return Builder(
            builder: (context) {
              if (homeViewType == HomeViewType.normal) {
                return HomeViewTypeNormal();
              }

              if (homeViewType == HomeViewType.popularMenu) {
                return HomeViewTypeMenus();
              }

              if (homeViewType == HomeViewType.popularFood) {
                return HomeViewTypeFoods();
              }

              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
