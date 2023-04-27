import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/history_model.dart';

class OrderItems extends StatelessWidget {
  final OrderModel item;

  const OrderItems({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final _image = item.carts.first.productModel.image?.url ?? '';
    final totalPrice = formatPriceToVND(item.total) + ' \đ';
    final createAt = convertTimeStamp(item.createdAt);
    return SizedBox(
      height: MediaQuery.of(context).size.shortestSide * 0.3,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AppNetworkImage(
                          url: _image,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.25,
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.25,
                          fit: BoxFit.cover)),
                  Expanded(
                    child: AppPadding(
                      padding: AppEdgeInsets.only(left: AppGapSize.medium),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText.bodyMedium(
                                          text: 'Code_Order'.tr +
                                              ' ${item.createdAt}',
                                          maxLines: 1,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.left),
                                      AppText.bodyMedium(
                                          text: item.createdAt,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                ),
                                AppPadding(
                                  padding: AppEdgeInsets.only(
                                      left: AppGapSize.medium),
                                  child: AppText.bodyLarge(
                                      text: totalPrice,
                                      color: ThemeColors.textPriceColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: AppPadding(
                                    padding: AppEdgeInsets.only(
                                        right: AppGapSize.small),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: AppText.bodySmall(
                                          text: createAt.trim(),
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColors.labelDarkColor,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      minWidth: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.2),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1),
                                              blurRadius: 4,
                                              offset: Offset(0, 2)),
                                        ],
                                        border: Border.all(
                                            color: item.status.color, width: 1),
                                        borderRadius: BorderRadius.circular(18),
                                        color: item.status.color
                                            .withOpacity(0.05)),
                                    child: AppPadding.small(
                                      child: AppText.labelSmall(
                                        text: item.status.json.tr,
                                        fontWeight: FontWeight.w400,
                                        color: item.status.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
