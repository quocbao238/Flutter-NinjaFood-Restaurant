import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_user/rating/controller/rating_screen_controller.dart';

class RatingMobileView extends GetView<RatingScreenController> {
  const RatingMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantImage = UserController.instance.currentUser.value?.photoUrl ?? '';
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: AppButtonBack(onPressed: () => Get.back()),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppNetworkImage(
                          width: MediaQuery.of(context).size.shortestSide * 0.4,
                          height: MediaQuery.of(context).size.shortestSide * 0.4,
                          borderRadius: 100,
                          url: restaurantImage),
                      AppPadding(
                        padding: AppEdgeInsets.only(top: AppGapSize.medium, bottom: AppGapSize.medium),
                        child: AppText.headlineMedium(text: 'Thank You!\nEnjoy Your Meal', fontWeight: FontWeight.bold),
                      ),
                      AppText.bodyMedium(text: 'Please help me rate Ninja Restaurant'),
                      AppPadding(
                        padding: AppEdgeInsets.only(top: AppGapSize.medium, bottom: AppGapSize.veryLarge),
                        child: RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.grey.withOpacity(0.6),
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => AppIcons.star(color: ThemeColors.primaryColor),
                            onRatingUpdate: (rating) => controller.onRatingUpdate(rating)),
                      ),
                      AppTextFormField(
                          prefixIcon: Icon(FontAwesomeIcons.penToSquare, color: ThemeColors.primaryColor),
                          hintText: 'Food feedback',
                          controller: controller.commentController)
                    ]),
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
              child: Obx(() {
                final enableSubmit = controller.enableSubmit.value;
                return Row(
                  children: [
                    if (enableSubmit)
                      Expanded(
                        flex: 3,
                        child: AnimationButton(
                          ratioWidthButton: 0.65,
                          ratioWidthDone: 0.45,
                          ratioWidthLoading: 0.55,
                          textButton: 'Submit',
                          onPressed: () => controller.onPressedSubmit(),
                          textDone: 'Done',
                          onDone: () => controller.onPressedSkip(),
                          textLoading: 'Loading',
                          loading: controller.loading.value,
                        ),
                      ),
                    Expanded(
                        flex: 2,
                        child: AppPadding(
                            padding: AppEdgeInsets.only(left: AppGapSize.medium),
                            child: AppButton.min(title: 'Skip', onPressed: () => controller.onPressedSkip())))
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
