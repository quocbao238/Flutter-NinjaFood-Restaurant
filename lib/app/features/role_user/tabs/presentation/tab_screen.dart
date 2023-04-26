import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'layout/mobile/tabs_mobile_view.dart';

class TabScreen extends GetView<UserController> {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final currentOrder = controller.currentOrder.value;
        if (currentOrder != null && currentOrder.status != HistoryStatus.done) {
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
                if (historyStatus == HistoryStatus.delivered)
                  AppPadding(
                      padding: const AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.veryLarge,
                          vertical: AppGapSize.large),
                      child: AppButton.max(
                          title: 'OrderReceived'.tr,
                          onPressed: () =>
                              controller.updateStatusOrder(currentOrder)))
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
