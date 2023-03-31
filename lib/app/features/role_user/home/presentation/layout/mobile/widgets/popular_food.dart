import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/helper/utils.dart';

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
                final popularFoodList = controller.product;
                if (popularFoodList.isEmpty) return Container();
                final isNormalViewType =
                    controller.homeViewType.value == HomeViewType.normal;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: isNormalViewType ? 3 : popularFoodList.length,
                  itemBuilder: (context, index) {
                    final productItem = popularFoodList[index];
                    final _foodName = productItem.name ?? '';
                    final _foodPrice = formatPriceToVND(productItem
                            .priceRange?.minimumPrice?.finalPrice?.value ??
                        0.0);

                    final _foodCurrency = (productItem
                            .priceRange?.minimumPrice?.finalPrice?.currency ??
                        '');
                    final _foodImage = productItem.image?.url ?? '';

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppPadding.medium(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(_foodImage,
                                      height: 64, width: 64, fit: BoxFit.fill),
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
}
