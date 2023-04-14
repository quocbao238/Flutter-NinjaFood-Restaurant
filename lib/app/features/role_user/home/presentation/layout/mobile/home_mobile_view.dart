import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/widgets.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/home_app_bar.dart';

class HomeMobileView extends GetView<HomeController> {
  const HomeMobileView({Key? key}) : super(key: key);

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

              if (homeViewType == HomeViewType.promotion) {
                return HomeViewTypePromotions();
              }

              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
