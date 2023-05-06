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

    var backgroundColor = isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary;

    if (isRead) backgroundColor = ThemeColors.primaryColor.withOpacity(0.1);

    return AppPadding.small(
      padding: AppEdgeInsets.only(top: AppGapSize.medium),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
            ),
        onPressed: onPressedItem,
        child: Row(
          children: [
            AppPadding.small(child: child),
            Expanded(
              flex: 4,
              child: AppPadding(
                padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small, vertical: AppGapSize.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText.bodySmall(
                      text: title,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    AppText.labelMedium(
                      text: message,
                      textAlign: TextAlign.start,
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
            IconButton(onPressed: () => onPressedMore?.call(), icon: Icon(Icons.more_horiz))
          ],
        ),
      ),
    );
  }
}
