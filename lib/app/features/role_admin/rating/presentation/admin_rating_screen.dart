import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/rating/controller/admin_rating_screen_controller.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminRatingScreen extends StatelessWidget {
  const AdminRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundCardColor = isDarkMode ? ThemeColors.backgroundTextFormDark() : ThemeColors.backgroundTextFormLight;
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.drawer(
        title: 'Rating_Rate'.tr,
      ),
      body: GetBuilder<AdminRatingController>(
        init: AdminRatingController(),
        builder: (controller) => ListView.builder(
          itemCount: controller.ratings.length,
          padding: EdgeInsets.only(
              top: AppGapSize.medium.size, left: AppGapSize.paddingMedium.size, right: AppGapSize.paddingMedium.size),
          itemBuilder: (context, index) {
            final _commentModel = controller.ratings[index];
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                  color: backgroundCardColor),
              margin: EdgeInsets.only(bottom: AppGapSize.paddingMedium.size),
              child: AppPadding.medium(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppNetworkImage(
                            width: kToolbarHeight,
                            height: kToolbarHeight,
                            borderRadius: 100,
                            url: _commentModel.userImage),
                        AppPadding.small(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.titleSmall(text: _commentModel.userName, fontWeight: FontWeight.bold),
                              RatingBarIndicator(
                                  itemCount: 5,
                                  itemSize: 18,
                                  rating: _commentModel.rating,
                                  itemBuilder: (context, index) => Icon(Icons.star, color: ThemeColors.primaryColor))
                            ],
                          ),
                        )
                      ],
                    ),
                    AppPadding(
                      padding: const AppEdgeInsets.only(top: AppGapSize.paddingMedium),
                      child: AppText.bodyLarge(
                        text: _commentModel.comment ?? '',
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
