import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ninjafood/app/widgets/row_text_value_widget.dart';

class PromotionDetailScreen extends StatelessWidget {
  final PromotionModel promotionModel;

  const PromotionDetailScreen({Key? key, required this.promotionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: AppButtonBack(
          onPressed: () => Navigator.of(context).pop(),
        ),
        body: AppPadding(
          padding: AppEdgeInsets.only(
            left: AppGapSize.medium,
            right: AppGapSize.medium,
            bottom: AppGapSize.medium,
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizeScale(
                    ratioHeight: 0.25,
                    ratioWidth: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(imageUrl: promotionModel.thumbnail ?? '', fit: BoxFit.fill))),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(vertical: AppGapSize.small),
                    child: AppText.titleLarge(text: promotionModel.title ?? '', textAlign: TextAlign.start)),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 1),
                RowTextValueWidget(title: 'Start Date: ', value: promotionModel.startDate ?? ''),
                RowTextValueWidget(title: 'End Date: ', value: promotionModel.endDate ?? ''),
                RowTextValueWidget(
                    title: 'Expires later: ',
                    value:
                        getExpiresDayLaterByTwoDateTime(promotionModel.startDate ?? '', promotionModel.endDate ?? '') +
                            ' days'),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 1),
                AppPadding(
                    padding: AppEdgeInsets.only(top: AppGapSize.small),
                    child: Builder(builder: (context) {
                      final textStyle = Theme.of(context).textTheme.bodyMedium!;
                      return Html(
                        data: promotionModel.content ?? '',
                        style: {
                          "span": Style(
                            fontSize: FontSize(textStyle.fontSize ?? 0),
                            color: textStyle.color,
                          ),
                        },
                      );
                    })),
              ],
            ),
          ),
        ));
  }
}
