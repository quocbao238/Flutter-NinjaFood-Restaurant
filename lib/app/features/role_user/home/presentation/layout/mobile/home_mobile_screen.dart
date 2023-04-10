import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/mobile_view_type/home_view_type_category.dart';
import 'package:ninjafood/app/widgets/app_bar_home_widget.dart';

import 'widgets/mobile_view_type/home_view_type_product.dart';
import 'widgets/mobile_view_type/home_view_type_normal.dart';

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: AppBarHomeWidget(),
      body: Obx(
        () {
          final isLoading = controller.loading.value;
          if (isLoading) {
            return const Center(child: AppLoading(isLoading: true));
          }
          final homeViewType = controller.homeViewType.value;
          return Builder(
            builder: (context) {
              if (homeViewType == HomeViewType.normal) {
                return HomeViewTypeNormal();
              }

              if (homeViewType == HomeViewType.popularMenu) {
                return HomeViewTypeCategory();
              }

              if (homeViewType == HomeViewType.popularFood) {
                return HomeViewTypeProduct();
              }

              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
