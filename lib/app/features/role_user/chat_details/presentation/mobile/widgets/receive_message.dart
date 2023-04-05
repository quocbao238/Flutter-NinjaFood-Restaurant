import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class ReceiveMessage extends StatelessWidget {
  const ReceiveMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.45),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: isDarkMode
                ? ThemeColors.backgroundTextFormDark()
                : Theme.of(context).colorScheme.onPrimary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding.small(
                  child: AppText.bodyMedium(
                text: 'Just to order',
                textAlign: TextAlign.start,
              )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: AppPadding(
                      padding: AppEdgeInsets.only(
                          right: AppGapSize.small, bottom: AppGapSize.small),
                      child: AppText.bodySmall(text: '20:00'))),
            ],
          ),
        ),
      ),
    );
  }
}
