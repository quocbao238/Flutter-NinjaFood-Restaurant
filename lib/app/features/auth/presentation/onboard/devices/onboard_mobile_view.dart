import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/auth/controllers/onboard_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class OnboardMobileScreen extends GetView<OnboardController> {
  const OnboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onboardListData = controller.onboardListData;

    final _pageController = controller.pageController;
    return AppScaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: _onboardListData.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            final item = _onboardListData[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSizeScale(
                    ratioHeight: 0.5,
                    ratioWidth: 1,
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.fill,
                    )),
                AppPadding(
                    padding: AppEdgeInsets.only(
                        top: AppGapSize.large,
                        left: AppGapSize.verylarge,
                        right: AppGapSize.verylarge),
                    child: AppText.headlineLarge(text: item.title)),
                AppPadding.medium(
                    padding: AppEdgeInsets.symmetric(
                        vertical: AppGapSize.medium,
                        horizontal: AppGapSize.large),
                    child: AppText.bodySmall(text: item.description)),
                AppPadding.large(
                  child: AppButton(
                    title: 'Next',
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
