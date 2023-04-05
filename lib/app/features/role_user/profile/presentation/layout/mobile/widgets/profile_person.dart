import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/infrastructure/models/profile_model.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/favorite_item.dart';

class ProfilePerson extends StatelessWidget {
  const ProfilePerson({
    super.key,
    required this.isDarkMode,
    required this.favoriteItem,
  });

  final bool isDarkMode;
  final List<FavoriteFood> favoriteItem;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppSizeScale(
        ratioHeight: MediaQuery.of(context).size.height,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: ThemeColors.textPriceColor.withOpacity(0.1)),
                child: AppPadding.small(
                  child: AppText.bodyMedium(
                    text: 'Member Gold',
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.textPriceColor,
                  ),
                ),
              ),
              AppPadding(
                padding:
                    AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.headlineMedium(
                      text: 'Anam Wusono',
                      fontWeight: FontWeight.bold,
                    ),
                    AppIcons.edit(),
                  ],
                ),
              ),
              AppText.bodyMedium(text: 'anamwp66@gmail.com'),
              AppPadding(
                padding:
                    AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? ThemeColors.backgroundTextFormDark()
                          : Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      AppPadding.medium(
                          child: AppText.bodyLarge(
                              text: 'You Have 3 Voucher',
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
              AppText.bodyLarge(
                text: 'Favorite',
                fontWeight: FontWeight.bold,
              ),
              FavoriteList(favoriteItem: favoriteItem, isDarkMode: isDarkMode)
            ],
          ),
        ),
      ),
    );
  }
}