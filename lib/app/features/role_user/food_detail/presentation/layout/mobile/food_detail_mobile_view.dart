import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/food_detail/controller/food_detail_controller.dart';
import 'package:ninjafood/app/features/role_user/food_detail/infrastructure/models/rating_n_cmt_models.dart';

class FoodDetailMobileView extends GetView<FoodDetailController> {
  const FoodDetailMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RateAndCmt> personRating = RateAndCmt.personRating;
    return AppScaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: true,
                elevation: 0,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/icons/food4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AppSizeScale(
                  ratioHeight: MediaQuery.of(context).size.height,
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
                                  color:
                                      ThemeColors.primaryColor.withOpacity(0.1)),
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
                                child: AppPadding.small(child: AppIcons.heart())),
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
                        AppText.bodyLarge(
                          text: 'Testimonials',
                          fontWeight: FontWeight.bold,
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: personRating.length,
                              itemBuilder: (context, index) {
                                final isDarkMode = Theme.of(context).brightness ==
                                    Brightness.dark;
                                final _personRating = personRating[index];
                                return AppPadding(
                                    padding: AppEdgeInsets.only(
                                        bottom: AppGapSize.medium),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: ColoredBox(
                                        color: isDarkMode
                                            ? ThemeColors.backgroundTextFormDark()
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                        child: AppPadding.medium(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(_personRating.image),
                                              Expanded(
                                                child: AppPadding(
                                                  padding: AppEdgeInsets.only(left: AppGapSize.medium),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppText.bodyLarge(text: _personRating.name),
                                                      AppText.bodyMedium(text: '12 April 2021'),
                                                      AppPadding(
                                                        padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                                                        child: AppText.bodyMedium(text: _personRating.comment,
                                                        textAlign: TextAlign.start,))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: AppGapSize.medium.size,
              right: AppGapSize.medium.size,
              child: AppButton.max(title: 'Add To Chart'))
        ],
      ),
    );
  }
}
