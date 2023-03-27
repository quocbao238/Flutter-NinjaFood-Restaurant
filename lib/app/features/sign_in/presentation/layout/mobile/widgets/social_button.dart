import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String title;
  final Widget iconWidget;
  final VoidCallback onPressed;
  const SocialButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.iconWidget});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFF4F4F4), width: 1),
                borderRadius: BorderRadius.circular(16.0)),
          )),
      onPressed: onPressed,
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            AppPadding(
                padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
                child: AppText.bodyMedium(text: title))
          ],
        ),
      ),
    );
  }
}
