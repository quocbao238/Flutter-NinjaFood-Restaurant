import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class ProductItem extends StatelessWidget {
  final String foodName;
  final String foodPrice;
  final String foodCurrency;
  final String foodImage;
  final VoidCallback? onTap;
  final Animation<double> animation;

  const ProductItem(
      {super.key,
      required this.foodName,
      required this.foodPrice,
      required this.foodCurrency,
      required this.foodImage,
      this.onTap,
      required this.animation});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => onTap?.call(),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            height:
                                MediaQuery.of(context).size.shortestSide * 0.2,
                            width:
                                MediaQuery.of(context).size.shortestSide * 0.2,
                            child: AppNetworkImage(url: foodImage)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: AppText.titleSmall(
                          text: foodName, textAlign: TextAlign.start),
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.only(left: AppGapSize.small),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText.titleLarge(
                              text: foodPrice,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              fontWeight: FontWeight.w400,
                              color: ThemeColors.textPriceColor),
                          AppText.titleSmall(
                            text: foodCurrency,
                            textAlign: TextAlign.end,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.textPriceColor,
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
