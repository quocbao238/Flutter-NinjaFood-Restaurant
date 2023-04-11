import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

class PromotionItem extends StatelessWidget {
  final PromotionModel promotion;
  final VoidCallback? onTap;

  const PromotionItem({Key? key, required this.promotion, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final expendsDayLater = getExpiresDayLaterByTwoDateTime(promotion.startDate ?? '', promotion.endDate ?? '');
    if (expendsDayLater == '0') return Container();
    return AppPadding(
      padding: AppEdgeInsets.only(bottom: AppGapSize.large),
      child: GestureDetector(
        onTap: () => Get.toNamed(AppRouteProvider.promotionDetailScreen, arguments: promotion),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: AppPadding.small(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: promotion.thumbnail ?? '',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      ),
                    ),
                    Expanded(
                        child: AppPadding(
                      padding:
                          AppEdgeInsets.only(left: AppGapSize.small, top: AppGapSize.small, bottom: AppGapSize.small),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.bodyMedium(
                              text: promotion.title ?? '',
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          PromotionText(title: 'Start Date: ', value: promotion.startDate ?? ''),
                          PromotionText(title: 'End Date: ', value: promotion.endDate ?? ''),
                          PromotionText(
                              title: 'Expires later: ',
                              value:
                                  getExpiresDayLaterByTwoDateTime(promotion.startDate ?? '', promotion.endDate ?? '') +
                                      ' days'),
                          // Text(promotion ''),
                        ],
                      ),
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class PromotionText extends StatelessWidget {
  final String title;
  final String value;

  const PromotionText({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.only(top: AppGapSize.small),
      child: Row(
        children: [
          AppText.bodySmall(text: title, fontWeight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: AppGapSize.small.size),
          Expanded(
            child: AppText.bodySmall(
                text: value,
                textAlign: TextAlign.end,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
