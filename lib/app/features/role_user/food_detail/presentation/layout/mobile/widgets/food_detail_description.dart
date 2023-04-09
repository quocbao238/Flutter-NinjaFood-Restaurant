import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/food_detail/infrastructure/models/rating_n_cmt_models.dart';
import 'package:ninjafood/app/features/role_user/food_detail/presentation/layout/mobile/widgets/reviewers.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({
    super.key,
    required this.personRating,
  });

  final List<RateAndCmt> personRating;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppSizeScale(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: ThemeColors.primaryColor
                            .withOpacity(0.1)),
                    child: AppPadding.small(
                      child: AppText.bodyMedium(
                        text: 'Popular',
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF1D1D).withOpacity(0.1)),
                      child:
                          AppPadding.small(child: AppIcons.heart())),
                ],
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(
                    vertical: AppGapSize.medium),
                child: AppText.headlineMedium(
                  text: 'Rainbow Sandwich Sugarless',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              AppPadding(
                  padding:
                      AppEdgeInsets.only(bottom: AppGapSize.medium),
                  child: AppIcons.locationMap()),
              AppText.bodyMedium(
                text:
                    'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.',
                textAlign: TextAlign.start,
              ),
              AppPadding.medium(
                  child: AppText.bodyMedium(
                text: '• Strowberry\n• Cream\n• wheat',
                textAlign: TextAlign.start,
              )),
              AppText.bodyMedium(
                text:
                    'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.',
                textAlign: TextAlign.start,
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(
                    vertical: AppGapSize.medium),
                child: AppText.bodyLarge(
                  text: 'Testimonials',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Reviewer(personRating: personRating),
            ],
          ),
        ),
      ),
    );
  }
}