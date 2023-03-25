import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxPhoto extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget iconPhoto;
  final textPhoto;
  const BoxPhoto({
    super.key,
    required this.onPressed,
    required this.iconPhoto,
    required this.textPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(-4, 4),
          ),
          BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.2), blurRadius: 8, offset: Offset(4, -4))
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppPadding(
                  padding: AppEdgeInsets.only(
                      top: AppGapSize.medium, bottom: AppGapSize.small),
                  child: iconPhoto),
              AppText.bodyLarge(text: textPhoto, fontWeight: FontWeight.w400)
            ],
          ),
        ),
      ),
    );
  }
}
