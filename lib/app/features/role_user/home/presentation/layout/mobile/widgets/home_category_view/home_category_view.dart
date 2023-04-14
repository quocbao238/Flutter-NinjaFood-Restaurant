library home_category_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/widgets/animation_grid.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
part 'home_category_grid_view.dart';
part 'home_category_item.dart';
part 'home_category_list_view.dart';


class CategoryPopular extends GetView<HomeController> {
  CategoryPopular({super.key});

  @override
  Widget build(BuildContext context) {
    final isViewMore =
        controller.homeViewType.value == HomeViewType.popularMenu;
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodyLarge(
                  text: 'Popular Menu'.tr, fontWeight: FontWeight.bold),
              if (!isViewMore)
                InkWell(
                    onTap: () => controller.onPressedViewMorePopularMenu(),
                    child: AppText.bodySmall(
                        text: 'View More'.tr,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.orangeColor)),
            ],
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
            child: Obx(() {
              final popularMenuList = controller.menus;
              if (popularMenuList.isEmpty) return SizedBox();
              return isViewMore
                  ? CategoryGridView(
                      menuList: popularMenuList,
                      onPressedMenu: (CategoryModel categoryModel) =>
                          controller.onPressedMenuItem(categoryModel),
                    )
                  : CategoryListView(
                      menuList: popularMenuList,
                      onPressedMenu: (CategoryModel categoryModel) =>
                          controller.onPressedMenuItem(categoryModel),
                    );
            }),
          )
        ],
      ),
    );
  }
}
