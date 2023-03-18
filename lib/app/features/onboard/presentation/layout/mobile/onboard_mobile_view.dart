import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/onboard/controllers/onboard_controller.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class OnboardMobileScreen extends GetView<OnboardController> {
  const OnboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onboardListData = controller.datas;
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
                    child: Image.asset(item.image, fit: BoxFit.cover)),
                AppPadding(
                    padding: AppEdgeInsets.only(
                        top: AppGapSize.large,
                        left: AppGapSize.verylarge,
                        right: AppGapSize.verylarge),
                    child: AppText.headlineMedium(
                        text: item.title.tr, fontWeight: FontWeight.bold)),
                AppPadding.medium(
                    padding: AppEdgeInsets.symmetric(
                        vertical: AppGapSize.medium,
                        horizontal: AppGapSize.large),
                    child: AppText.bodySmall(text: item.description.tr)),
                AppPadding.large(
                  child: AppButton.min(
                      title: 'Next_Button'.tr,
                      onPressed: () => controller.onPressedNext(index)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
