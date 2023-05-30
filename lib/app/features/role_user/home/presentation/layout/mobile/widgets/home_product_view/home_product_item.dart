part of 'home_product_view.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productItem;
  final Animation<double> animation;

  const ProductItem(
      {super.key, required this.animation, required this.productItem});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final _foodName = productItem.name ?? '';
    final _foodPrice = formatPriceToVND(
        productItem.priceRange?.minimumPrice?.finalPrice?.value ?? 0.0);
    final _foodCurrency =
        (productItem.priceRange?.minimumPrice?.finalPrice?.currency ?? '');
    final _foodImage = productItem.image?.url ?? '';

    return GestureDetector(
      onTap: () => Get.toNamed(AppRouteProvider.foodDetailScreen,
          arguments: productItem),
      child: AnimationItem(
        animation: animation,
        child: AppPadding(
          padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ColoredBox(
              color: isDarkMode
                  ? ThemeColors.backgroundTextFormDark()
                  : Theme.of(context).colorScheme.onPrimary,
              child: AppPadding.medium(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPadding(
                      padding: AppEdgeInsets.only(right: AppGapSize.medium),
                      child: AppNetworkImage(
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.2,
                          width: MediaQuery.of(context).size.shortestSide * 0.2,
                          borderRadius: 10,
                          url: _foodImage),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.titleSmall(
                              text: _foodName, textAlign: TextAlign.start),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppPadding(
                                  padding: AppEdgeInsets.only(
                                      right: AppGapSize.small),
                                  child: AppText.titleLarge(
                                      text: "$_foodPrice $_foodCurrency",
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColors.textPriceColor),
                                ),
                              ),
                              ProductFavoriteItem(
                                  productId: productItem.id ?? 0),
                              AppPadding.small(),
                              ProductAddToCartWidget(productModel: productItem),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
