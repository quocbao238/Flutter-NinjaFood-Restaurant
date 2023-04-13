import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxNotification extends StatelessWidget {
  final Widget child;
  final String notice;
  final String time;

  const BoxNotification({
    super.key,
    required this.child,
    required this.notice,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppPadding(
      padding: AppEdgeInsets.only(top: AppGapSize.medium),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isDarkMode
                ? ThemeColors.backgroundTextFormDark()
                : Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: [
            AppPadding.medium(
              child: SizedBox(
                height: 40,
                width: 40,
                child: child,
              ),
            ),
            Expanded(
              child: AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.bodyLarge(
                      text: notice,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    AppText.bodyMedium(
                      text: time,
                      color: isDarkMode
                          ? ThemeColors.textDarkColor.withOpacity(0.3)
                          : ThemeColors.textLightColor.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
