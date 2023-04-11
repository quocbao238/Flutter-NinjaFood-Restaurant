import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/profile_controller.dart';

class FavoriteList extends GetView<ProfileController> {
  const FavoriteList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final lstFavorite = controller.lstProducts.toList();
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lstFavorite.length,
          itemBuilder: (context, index) {
            final _favoriteItem = lstFavorite[index];
            return AppPadding(
              padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ColoredBox(
                  color: isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
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
                              fit: BoxFit.cover,
                            )),
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
                            AppPadding(
                                padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: ThemeColors.textRedColor,
                                  ),
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
            );
          });
    });
  }
}
