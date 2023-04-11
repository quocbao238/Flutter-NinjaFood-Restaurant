import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxDetailprice extends StatelessWidget {
  const BoxDetailprice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppPadding(
        padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/placeOrder.png'),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
              gradient: ThemeColors.gradientButtonColor,
              borderRadius: BorderRadius.circular(16)),
          child: AppPadding.small(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPadding(
                  padding: AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyMedium(
                        text: 'Sub-Total',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText.bodyMedium(
                        text: '120 \$',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyMedium(
                        text: 'Delivery Charge',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText.bodyMedium(
                        text: '120 \$',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyMedium(
                        text: 'Discount',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText.bodyMedium(
                        text: '120 \$',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.titleSmall(
                        text: 'Total',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                      AppText.titleSmall(
                        text: '150 \$',
                        color: ThemeColors.textDarkColor,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: kToolbarHeight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: AppText.bodyMedium(
                      text: 'Place My Order',
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.primaryColor,
                    ),
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style
                        ?.copyWith(
                          backgroundColor: MaterialStateProperty.all(
                              ThemeColors.textDarkColor),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}