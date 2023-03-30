import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxSpecialDeal extends StatelessWidget {
  const BoxSpecialDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPadding.medium(
      child: AppSizeScale(
        ratioWidth: 1,
        ratioHeight: 0.2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: ThemeColors.gradientButtonColor,
            image: DecorationImage(
              image: AssetImage('assets/icons/box_special.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex:4,
                child: Image.asset('assets/icons/thanbomy.png',
                    fit: BoxFit.cover),
              ),
              Expanded(
                flex: 3 ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppPadding(
                        // TODO: fix line max = 2
                        padding: AppEdgeInsets.only(right: AppGapSize.small),
                        child: AppText.titleSmall(
                          text: 'Special Deal For October',
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                          color: Colors.white,
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                        child: AppPadding(
                          padding: AppEdgeInsets.symmetric(
                              horizontal: AppGapSize.small),
                          child: AppText.bodySmall(
                            text: 'Buy now',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
