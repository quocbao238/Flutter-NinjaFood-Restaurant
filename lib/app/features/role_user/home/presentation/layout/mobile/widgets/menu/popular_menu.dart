import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/menu/menu_grid_view.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/menu/menu_list_view_horizontal.dart';
import 'package:ninjafood/app/models/category_model.dart';

class PopularMenu extends GetView<HomeController> {
  PopularMenu({super.key});

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
                  ? MenuGirdView(
                      menuList: popularMenuList,
                      onPressedMenu: (CategoryModel categoryModel) =>
                          controller.onPressedMenuItem(categoryModel),
                    )
                  : MenuListViewHorizontal(
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
