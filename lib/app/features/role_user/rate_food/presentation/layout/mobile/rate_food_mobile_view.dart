import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateFoodMobileView extends GetView {
  const RateFoodMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.splash(
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIcons.success(),
                  AppPadding(
                    padding: AppEdgeInsets.only(
                        top: AppGapSize.large, bottom: AppGapSize.medium),
                    child: AppText.headlineMedium(
                      text: 'Thank You!\nEnjoy Your Meal',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText.bodyMedium(text: 'Please rate your Food'),
                  AppPadding(
                    padding: AppEdgeInsets.only(top: AppGapSize.large),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: ThemeColors.textPriceColor.withOpacity(0.3),
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => AppIcons.star(
                        color: ThemeColors.textPriceColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ],
              ),
            ),
            AppTextFormField(
                prefixIcon: Icon(
                  FontAwesomeIcons.penToSquare,
                  color: ThemeColors.primaryColor,
                ),
                hintText: 'Leave feedback',
                controller:
                    TextEditingController.fromValue(TextEditingValue.empty)),
            AppPadding(
              padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: AppButton.max(
                      title: 'Submit',
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AppPadding(
                      padding: AppEdgeInsets.only(left: AppGapSize.medium),
                      child: AppButton.min(
                        title: 'Skip',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
