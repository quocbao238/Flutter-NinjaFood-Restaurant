import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/infrastructure/models/profile_model.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/favorite_item.dart';
import 'package:ninjafood/app/globalController/userController.dart';

class ProfilePerson extends GetView<UserController> {

  const ProfilePerson();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final currentUser = controller.getCurrentUser;
    return SliverToBoxAdapter(
      child: AppSizeScale(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18), color: ThemeColors.textPriceColor.withOpacity(0.1)),
                child: AppPadding.small(
                  child: AppText.bodyMedium(
                    text: currentUser?.userType?.name ?? '',
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.textPriceColor,
                  ),
                ),
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.headlineMedium(text: currentUser!.getName(), fontWeight: FontWeight.bold),
                    AppIcons.edit()
                  ],
                ),
              ),
              AppText.bodyMedium(text: currentUser.email ?? '', fontWeight: FontWeight.w400),
              AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color:
                          isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      AppPadding.medium(child: AppIcons.voucher()),
                      AppText.bodyLarge(text: 'You Have 3 Voucher', fontWeight: FontWeight.w400)
                    ],
                  ),
                ),
              ),
              AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                child: AppText.bodyLarge(
                  text: 'Favorite',
                  fontWeight: FontWeight.bold,
                ),
              ),
              FavoriteList()
            ],
          ),
        ),
      ),
    );
  }
}
