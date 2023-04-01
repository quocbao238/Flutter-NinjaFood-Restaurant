import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class PopularFood extends GetView<HomeController> {
  const PopularFood({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Obx(() {
                final popularFoodList = controller.products;
                if (popularFoodList.isEmpty) return Container();
                final isNormalViewType =
                    controller.homeViewType.value == HomeViewType.normal;
                return AnimationList(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: isNormalViewType ? 3 : popularFoodList.length,
                  itemBuilder: (context, index, animation) {
                    final productItem = popularFoodList[index];
                    final _foodName = productItem.name ?? '';
                    final _foodPrice = formatPriceToVND(productItem
                            .priceRange?.minimumPrice?.finalPrice?.value ??
                        0.0);

                    final _foodCurrency = (productItem
                            .priceRange?.minimumPrice?.finalPrice?.currency ??
                        '');
                    final _foodImage = productItem.image?.url ?? '';

                    return AnimationItem(
                      animation: animation,
                      child: AppPadding(
                        padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: ColoredBox(
                            color: isDarkMode
                                ? ThemeColors.backgroundTextFormDark()
                                : Theme.of(context).colorScheme.onPrimary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppPadding.medium(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        height: kToolbarHeight,
                                        width: kToolbarHeight,
                                        child:
                                            AppNetworkImage(url: _foodImage)),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: AppText.bodyLarge(
                                      text: _foodName,
                                      textAlign: TextAlign.start),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: AppPadding.small(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.titleSmall(
                                            text: _foodPrice,
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w400,
                                            color: ThemeColors.textPriceColor),
                                        AppText.titleSmall(
                                          text: _foodCurrency,
                                          textAlign: TextAlign.end,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColors.textPriceColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    Widget child,
    int index,
    Animation<double> animation,
  ) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: child,
        ),
      );
}
