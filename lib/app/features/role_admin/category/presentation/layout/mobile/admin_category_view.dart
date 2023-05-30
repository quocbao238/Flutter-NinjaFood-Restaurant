import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/home_category_view/home_category_view.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminCategoryView extends StatelessWidget {
  const AdminCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(title: 'Drawer_Menu'.tr),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Obx(() {
            if (controller.loading.value) return AppLoading(size: kToolbarHeight, isLoading: true);
            final menuList = controller.menus;
            if (menuList.isEmpty) return SizedBox();
            return AppAnimationGridView(
              padding: EdgeInsets.all(AppGapSize.medium.size),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: AppGapSize.medium.size, crossAxisSpacing: AppGapSize.medium.size),
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: menuList.length,
              itemBuilder: (context, index, animation) => CategoryItem(
                  menuItem: menuList[index],
                  onPressedMenu: (CategoryModel categoryModel) => controller.onPressedMenuItem(categoryModel),
                  animation: animation),
            );
          });
        },
      ),
    );
  }
}
