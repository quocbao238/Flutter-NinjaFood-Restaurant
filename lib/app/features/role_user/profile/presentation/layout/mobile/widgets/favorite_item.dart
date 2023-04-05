import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/infrastructure/models/profile_model.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
    required this.favoriteItem,
    required this.isDarkMode,
  });

  final List<FavoriteFood> favoriteItem;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: favoriteItem.length,
          itemBuilder: (context, index) {
            final _favoriteItem = favoriteItem[index];
            return AppPadding(
              padding:
                  AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ColoredBox(
                  color: isDarkMode
                      ? ThemeColors.backgroundTextFormDark()
                      : Theme.of(context).colorScheme.onPrimary,
                  child: AppPadding(
                    padding: AppEdgeInsets.symmetric(
                        vertical: AppGapSize.medium,
                        horizontal: AppGapSize.medium),
                    child: Row(
                      children: [
                        Image.asset(_favoriteItem.image),
                        Expanded(
                          child: AppPadding(
                            padding: AppEdgeInsets.only(
                                left: AppGapSize.medium),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                AppText.bodyLarge(
                                    text: _favoriteItem.name),
                                AppText.titleMedium(
                                    text:
                                        '\$${_favoriteItem.price}',
                                    color:
                                        ThemeColors.primaryColor)
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: AppText.bodyMedium(
                            text: 'Buy Again',
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.textDarkColor,
                          ),
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                                  backgroundColor:
                                      MaterialStateProperty.all(
                                          ThemeColors
                                              .primaryColor)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}