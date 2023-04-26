import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'layout/mobile/tabs_mobile_view.dart';

class TabScreen extends GetView<UserController> {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final currentOrder = controller.currentOrder.value;
        if (currentOrder != null) {
          final historyStatus = currentOrder.status;
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Lottie.asset(historyStatus.lottieUrl,
                        width: MediaQuery.of(context).size.shortestSide * 0.8,
                        height: MediaQuery.of(context).size.shortestSide * 0.8,
                        fit: BoxFit.fill)),
                // AppPadding.small(),
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.veryLarge,
                      vertical: AppGapSize.large),
                  child: AppText.bodyLarge(
                      textAlign: TextAlign.center,
                      text: historyStatus.status.tr,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }
        return AppViewLayout(
          mobileView: TabsMobileView(),
        );
      },
    );
  }
}
