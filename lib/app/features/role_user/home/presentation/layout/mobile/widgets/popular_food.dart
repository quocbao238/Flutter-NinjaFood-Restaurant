import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';

class PopularFood extends GetView<HomeController> {
  const PopularFood({super.key});

  @override
  Widget build(BuildContext context) {
    final popularFoodList = controller.popularFood;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodyLarge(
                text: 'Popular Food'.tr,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                onTap: () => controller.onPressedViewMorePopularFood(),
                child: AppText.bodySmall(
                  text: 'View More'.tr,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFF7C32),
                ),
              ),
            ],
          ),
          AppPadding(
            padding: AppEdgeInsets.only(top: AppGapSize.medium),
            child: AppSizeScale(
              ratioWidth: 1,
              child: ListView.builder(

                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularFoodList.length,
                itemBuilder: (context, index) {
                  final _listMenu = popularFoodList[index];
                  return AppPadding(
                    padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ColoredBox(
                        color: isDarkMode
                            ? ThemeColors.backgroundTextFormDark()
                            : Theme.of(context).colorScheme.onPrimary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppPadding.medium(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(_listMenu.image.toString(),
                                    height: 64, width: 64, fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText.bodyLarge(
                                      text: _listMenu.name.toString()),
                                  AppText.labelLarge(
                                    text: _listMenu.name.toString(),
                                    color: isDarkMode
                                        ? ThemeColors.labelDarkColor
                                        : ThemeColors.labelColor.withOpacity(0.3)
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: AppPadding.small(
                                child: AppText.titleLarge(
                                    text: '\$${_listMenu.price.toString()}',
                                    textAlign: TextAlign.end,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColors.textPriceColor),
                              ),
                            ),
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
