import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.45),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: ThemeColors.gradientButtonColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding.small(
                  child: AppText.bodyMedium(
                text: 'Okay, for what level of spiciness?',
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
