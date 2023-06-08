part of 'profile_mobile_view.dart';

class FavoriteList extends GetView<FavoriteController> {
  const FavoriteList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () {
        if (controller.lstFavoriteProduct.isEmpty) return SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPadding(
              padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: AppText.bodyLarge(
                  text: 'Favorite_Food'.tr, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.lstFavoriteProduct.length,
              itemBuilder: (context, index) {
                final _favoriteItem = controller.lstFavoriteProduct[index];
                return InkWell(
                  onTap: () => controller.onPressedItem(_favoriteItem),
                  child: AppPadding(
                    padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ColoredBox(
                        color: isDarkMode
                            ? ThemeColors.backgroundTextFormDark()
                            : Theme.of(context).colorScheme.onPrimary,
                        child: AppPadding.small(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: CachedNetworkImage(
                                      imageUrl: _favoriteItem.image?.url ?? '',
                                      width: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.2,
                                      height: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.2,
                                      fit: BoxFit.cover)),
                              Expanded(
                                child: AppPadding(
                                  padding: AppEdgeInsets.only(
                                      left: AppGapSize.medium),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText.bodyLarge(
                                          text: _favoriteItem.name ?? '',
                                          textAlign: TextAlign.left),
                                      AppPadding(
                                        padding: AppEdgeInsets.only(
                                            top: AppGapSize.small),
                                        child: AppText.titleMedium(
                                            text: '\$${_favoriteItem.getPrice}',
                                            color: ThemeColors.textPriceColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Widget Button Icon unFavorite
                                  AppPadding(
                                      padding: AppEdgeInsets.only(
                                          bottom: AppGapSize.small),
                                      child: ProductFavoriteItem(
                                          productId: _favoriteItem.id ?? 0)),
                                  ProductAddToCartWidget(
                                      productModel: _favoriteItem),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
