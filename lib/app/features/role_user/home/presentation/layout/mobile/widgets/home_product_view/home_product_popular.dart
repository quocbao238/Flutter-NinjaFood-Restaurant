part of 'home_product_view.dart';

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
                text: 'Home_Popular_Food'.tr,
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
                        text: 'Home_ViewMore'.tr,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.orangeColor));
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
                        : popularFoodList);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
