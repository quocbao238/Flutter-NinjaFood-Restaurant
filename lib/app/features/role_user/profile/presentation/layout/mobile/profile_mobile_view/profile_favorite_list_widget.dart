part of 'profile_mobile_view.dart';

class FavoriteList extends GetView<ProfileController> {
  const FavoriteList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final userController = UserController.instance;
    return Obx(
      () {
        final lstFavorite = controller.lstProducts;
        if (lstFavorite.isEmpty) return SizedBox.shrink();
        if (controller.loading.value) return Center(child: AppLoading(isLoading: true));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                child: AppText.bodyLarge(text: 'Favorite', fontWeight: FontWeight.bold)),
            AnimatedList(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                initialItemCount: lstFavorite.length,
                itemBuilder: (context, index, animation) {
                  final _favoriteItem = lstFavorite[index];
                  return AnimationItem(
                    animation: animation,
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
                                        width: MediaQuery.of(context).size.shortestSide * 0.2,
                                        height: MediaQuery.of(context).size.shortestSide * 0.2,
                                        fit: BoxFit.cover)),
                                Expanded(
                                  child: AppPadding(
                                    padding: AppEdgeInsets.only(left: AppGapSize.medium),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText.bodyLarge(text: _favoriteItem.name ?? '', textAlign: TextAlign.left),
                                        AppPadding(
                                          padding: AppEdgeInsets.only(top: AppGapSize.small),
                                          child: AppText.titleMedium(
                                              text: '\$${_favoriteItem.getPrice}', color: ThemeColors.textPriceColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    // Widget Button Icon unFavorite
                                    AppPadding(
                                        padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                                        child: ProductFavoriteItem(
                                          productId: _favoriteItem.id ?? 0,
                                          onPressedFavorite: (v) =>
                                              userController.favoriteProduct(productId: _favoriteItem.id ?? 0),
                                        )),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: AppText.bodyMedium(
                                          text: 'Buy Now',
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColors.textDarkColor),
                                      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                          backgroundColor: MaterialStateProperty.all(ThemeColors.primaryColor)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
