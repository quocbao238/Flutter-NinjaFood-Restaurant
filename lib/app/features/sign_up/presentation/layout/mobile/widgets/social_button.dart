import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

enum SocialButtonType {
  facebook('Facebook', 'assets/images/facebook_icon.svg'),
  google('Google', 'assets/images/google_icon.svg');

  final String title;
  final String svgImage;
  const SocialButtonType(this.title, this.svgImage);
}

class SocialButtonWidget extends StatelessWidget {
  final SocialButtonType socialButtonType;
  final VoidCallback onPressed;
  const SocialButtonWidget(
      {super.key, required this.socialButtonType, required this.onPressed});

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
            ),
          ),
      onPressed: () {},
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(socialButtonType.svgImage),
            AppPadding(
              padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
              child: AppText.bodyMedium(text: socialButtonType.title),
            )
          ],
        ),
      ),
    );
  }
}
