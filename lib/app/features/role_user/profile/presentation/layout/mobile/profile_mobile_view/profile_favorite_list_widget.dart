part of 'profile_mobile_view.dart';

class FavoriteList extends GetView<ProfileController> {
  const FavoriteList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final userController = UserController.instance;
    return Obx(
      () {
        final lstFavorite = controller.lstProducts.toList();
        if (lstFavorite.isEmpty) return SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                child: AppText.bodyLarge(
                    text: 'Favorite_Food'.tr, fontWeight: FontWeight.bold)),
            AnimatedList(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              initialItemCount: lstFavorite.length,
              itemBuilder: (context, index, animation) {
                final _favoriteItem = lstFavorite[index];
                return InkWell(
                  onTap: () => controller.onPressedFavoriteItem(_favoriteItem),
                  child: AnimationItem(
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
                                        imageUrl:
                                            _favoriteItem.image?.url ?? '',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              text:
                                                  '\$${_favoriteItem.getPrice}',
                                              color:
                                                  ThemeColors.textPriceColor),
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
                                          productId: _favoriteItem.id ?? 0,
                                          onPressedFavorite: (v) =>
                                              userController.setFavoriteProduct(
                                                  productId:
                                                      _favoriteItem.id ?? 0),
                                        )),
                                    Obx(() {
                                      bool isExist = (userController
                                                  .currentUser.value?.carts ??
                                              [])
                                          .any((element) =>
                                              element.productModel.id ==
                                              _favoriteItem.id);
                                      return SizedBox(
                                        width: 36,
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (!isExist) {
                                              userController.addProductToCard(
                                                  productModel: _favoriteItem);
                                              return;
                                            }
                                            TabsController.instance
                                                .onChangeToCartScreen();
                                            Get.until((route) =>
                                                Get.currentRoute ==
                                                AppRouteProvider.tabScreen);
                                          },
                                          style: Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.copyWith(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          ThemeColors
                                                              .backgroundTextFormDark()),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          Size(24, 24)),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.zero),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(96.0)))),
                                          child: Icon(
                                              !isExist
                                                  ? FontAwesomeIcons.cartPlus
                                                  : FontAwesomeIcons
                                                      .cartShopping,
                                              color: !isExist
                                                  ? ThemeColors.textDarkColor
                                                  : ThemeColors.primaryColor,
                                              size: 12.0),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
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
