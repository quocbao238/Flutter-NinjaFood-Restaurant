import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';

class PopularMenu extends GetView<HomeController> {
  PopularMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final popularMenuList = controller.popularMenu;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodyLarge(
                text: 'Popular Menu'.tr,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                onTap: () => controller.onPressedViewMorePopularMenu(),
                child: AppText.bodySmall(
                    text: 'View More'.tr,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.orangeColor),
              ),
            ],
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
            child: AppSizeScale(
              ratioWidth: 1,
              ratioHeight: 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMenuList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final _listMenu = popularMenuList[index];
                  return AppPadding(
                    padding: AppEdgeInsets.only(right: AppGapSize.medium),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AppSizeScale(
                        backgroundColor: isDarkMode
                            ? ThemeColors.backgroundTextFormDark()
                            : Theme.of(context).colorScheme.onPrimary,
                        ratioWidth: 0.4,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                _listMenu.image.toString(),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                            ),
                            AppPadding.small(
                              child: AppText.bodyLarge(
                                text: _listMenu.name.toString(),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
