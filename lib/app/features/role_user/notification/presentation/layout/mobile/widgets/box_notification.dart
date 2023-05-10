import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxNotification extends StatelessWidget {
  final Widget child;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final VoidCallback? onPressedItem;
  final VoidCallback? onPressedMore;

  const BoxNotification({
    super.key,
    required this.child,
    required this.title,
    required this.time,
    required this.message,
    this.onPressedItem,
    required this.isRead,
    this.onPressedMore,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    var backgroundColor = isDarkMode
        ? ThemeColors.backgroundTextFormDark()
        : Theme.of(context).colorScheme.onPrimary;

    if (isRead) backgroundColor = backgroundColor.withOpacity(0.4);

    return AppPadding.small(
      padding: AppEdgeInsets.only(top: AppGapSize.medium),
      child: GestureDetector(
        onTap: () => onPressedItem?.call(),
        child: Container(
          height: MediaQuery.of(context).size.shortestSide * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.25),
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ],
            color: backgroundColor,
          ),
          child: Row(
            children: [
              AppPadding.small(child: child),
              Expanded(
                flex: 4,
                child: AppPadding(
                  padding: AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.small, vertical: AppGapSize.small),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppText.bodyMedium(
                        text: title,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      AppPadding(
                        padding: AppEdgeInsets.symmetric(
                          vertical: AppGapSize.small,
                        ),
                        child: AppText.bodySmall(
                          text: message,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      // AppPadding.small(),
                      AppText.labelSmall(
                          text: time,
                          color: isDarkMode
                              ? ThemeColors.textDarkColor.withOpacity(0.3)
                              : ThemeColors.textLightColor.withOpacity(0.3)),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => onPressedMore?.call(),
                  icon: Icon(Icons.more_horiz))
            ],
          ),
        ),
      ),
    );
  }
}
