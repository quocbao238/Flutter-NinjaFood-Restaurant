import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxSpecialDeal extends StatelessWidget {
  const BoxSpecialDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: ThemeColors.gradientButtonColor,
          image: DecorationImage(
              image: AssetImage('assets/icons/box_special.png'),
              fit: BoxFit.fill)),
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/special_deal.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 0,
            child: Column(
              children: [
                AppPadding(
                    padding: AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.large,
                        vertical: AppGapSize.small),
                    child: AppText.titleSmall(
                      text: 'Special Deal \nFor October',
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      color: Colors.white,
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: AppText.bodySmall(
                      text: 'Buy now',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
