import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/product_view/product_list_view.dart';

class ProductPopular extends GetView<HomeController> {
  const ProductPopular({super.key});

  @override
  Widget build(BuildContext context) {
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
              Obx(() {
                final isNormalViewType =
                    controller.homeViewType.value == HomeViewType.normal;
                if (!isNormalViewType) {
                  return SizedBox.shrink();
                }
                return InkWell(
                  onTap: () => controller.onPressedViewMorePopularFood(),
                  child: AppText.bodySmall(
                    text: 'View More'.tr,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.orangeColor,
                  ),
                );
              }),
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
                return ProductList(
                  productList: isNormalViewType
                      ? popularFoodList.sublist(0, 3)
                      : popularFoodList,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
