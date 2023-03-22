import 'package:flutter/material.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

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
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.medium, bottom: AppGapSize.small),
                child: iconPhoto),
            AppText.bodyLarge(text: textPhoto, fontWeight: FontWeight.w400)
          ],
        ),
      ),
    );
  }
}
