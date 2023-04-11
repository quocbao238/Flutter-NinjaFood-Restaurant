import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/profile_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
import 'package:ninjafood/app/widgets/favorite_item.dart';

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
        return AnimatedList(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            initialItemCount: lstFavorite.length,
            itemBuilder: (context, index, animation) {
              final _favoriteItem = lstFavorite[index];
              return AnimationItem(
                animation: animation,
                child: AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ColoredBox(
                      color:
                          isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
                      child: AppPadding(
                        padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium, horizontal: AppGapSize.medium),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                    imageUrl: _favoriteItem.image?.url ?? '',
                                    width: 64,
                                    height: 64,
                                    fit: BoxFit.cover)),
                            Expanded(
                              child: AppPadding(
                                padding: AppEdgeInsets.only(left: AppGapSize.medium),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.bodyLarge(text: _favoriteItem.name ?? '', textAlign: TextAlign.left),
                                    AppText.titleMedium(
                                        text: '\$${_favoriteItem.getPrice}', color: ThemeColors.primaryColor)
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                // Widget Button Icon unFavorite
                                AppPadding(
                                    padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                                    child: FavoriteItem(
                                      productId: _favoriteItem.id ?? 0,
                                      onPressedFavorite: (v) =>
                                          userController.favoriteProduct(productId: _favoriteItem.id ?? 0),
                                    )),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: AppText.bodyMedium(
                                      text: 'Buy Now', fontWeight: FontWeight.w400, color: ThemeColors.textDarkColor),
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style
                                      ?.copyWith(backgroundColor: MaterialStateProperty.all(ThemeColors.primaryColor)),
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
            });
      },
    );
  }
}
