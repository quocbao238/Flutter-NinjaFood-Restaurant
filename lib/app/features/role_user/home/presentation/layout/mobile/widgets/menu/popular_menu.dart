import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/widgets/animation_grid.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class PopularMenu extends GetView<HomeController> {
  PopularMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
            child: isViewMore
                ? Obx(
                    () {
                      final popularMenuList = controller.menus;
                      if (popularMenuList.isEmpty) return SizedBox();
                      return AnimationGridView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppGapSize.medium.size,
                          crossAxisSpacing: AppGapSize.medium.size,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: popularMenuList.length,
                        itemBuilder: (context, index, animation) {
                          final _menuItem = popularMenuList[index];
                          final _menuName = _menuItem.name ?? '';
                          final _menuImage = controller
                              .getImageUrlByProductId(_menuItem.productIds![1]);
                          return GestureDetector(
                            onTap: () =>
                                controller.onPressedMenuItem(_menuItem),
                            child: AnimationItem(
                              animation: animation,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: AppSizeScale(
                                  backgroundColor: isDarkMode
                                      ? ThemeColors.backgroundTextFormDark()
                                      : Theme.of(context).colorScheme.onPrimary,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.network(_menuImage,
                                            fit: BoxFit.cover),
                                      ),
                                      AppPadding.small(
                                        child: AppText.bodyLarge(
                                            text: _menuName,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : AppSizeScale(
                    ratioWidth: 1,
                    ratioHeight: 0.2,
                    child: Obx(
                      () {
                        final popularMenuList = controller.menus;
                        if (popularMenuList.isEmpty) return SizedBox();
                        return AnimationList(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMenuList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index, animation) {
                            final _items = popularMenuList[index];
                            final _image = controller
                                .getImageUrlByProductId(_items.productIds![1]);
                            final _name = _items.name ?? '';
                            return AnimationItem(
                              animation: animation,
                              child: AppPadding(
                                padding: AppEdgeInsets.only(
                                    right: AppGapSize.medium),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: AppSizeScale(
                                    backgroundColor: isDarkMode
                                        ? ThemeColors.backgroundTextFormDark()
                                        : Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                    ratioWidth: 0.4,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                              width: double.infinity,
                                              child:
                                                  AppNetworkImage(url: _image)),
                                        ),
                                        AppPadding.small(
                                          child: AppText.bodyLarge(
                                              text: _name,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
