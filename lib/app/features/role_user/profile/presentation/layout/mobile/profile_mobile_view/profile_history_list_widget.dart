part of 'profile_mobile_view.dart';

class HistoryList extends GetView<ProfileController> {
  const HistoryList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () {
        final lstHistory = controller.lstHistory.toList();
        if (lstHistory.isEmpty) return SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                child: AppText.bodyLarge(text: 'History', fontWeight: FontWeight.bold)),
            AnimatedList(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                initialItemCount: lstHistory.length,
                itemBuilder: (context, index, animation) {
                  final _historyItem = lstHistory[index];
                  final _image = _historyItem.carts.first.productModel.image?.url ?? '';
                  final totalPrice = formatPriceToVND(_historyItem.total) + '\nVND';
                  final createAt = convertTimeStamp(_historyItem.createdAt);
                  return AnimationItem(
                    animation: animation,
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
                                    child: CachedNetworkImage(
                                        imageUrl: _image,
                                        width: MediaQuery.of(context).size.shortestSide * 0.2,
                                        height: MediaQuery.of(context).size.shortestSide * 0.2,
                                        fit: BoxFit.cover)),
                                Expanded(
                                  child: AppPadding(
                                    padding: AppEdgeInsets.only(left: AppGapSize.medium),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText.bodyLarge(
                                          text: 'Ninja Food Restaurant',
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.left,
                                        ),
                                        AppPadding(
                                          padding: AppEdgeInsets.only(top: AppGapSize.small),
                                          child: FittedBox(
                                            child: AppText.bodyMedium(
                                                text: createAt,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AppPadding(
                                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                                  child: Container(
                                    width: 1,
                                    height: MediaQuery.of(context).size.shortestSide * 0.15,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    AppText.bodyLarge(
                                        text: totalPrice, color: ThemeColors.textRedColor, fontWeight: FontWeight.bold),
                                    !_historyItem.isRating
                                        ? SizedBox()
                                        : ElevatedButton(
                                            onPressed: () => controller.onPressRating(_historyItem),
                                            child: AppText.bodyMedium(
                                                text: 'Rating',
                                                fontWeight: FontWeight.w400,
                                                color: ThemeColors.textDarkColor),
                                            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                                backgroundColor: MaterialStateProperty.all(ThemeColors.primaryColor)),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
