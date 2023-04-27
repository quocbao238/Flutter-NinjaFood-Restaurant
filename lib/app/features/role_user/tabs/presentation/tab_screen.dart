import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/features/role_admin/tabs/presentation/view/mobile/admin_tab_mobile_view.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/widgets/role_wrapper.dart';
import 'layout/mobile/tabs_mobile_view.dart';

class TabScreen extends GetView<DeliveryController> {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoleWrapper(
      adminView: const AdminTabsMobileView(),
      userView: Obx(
        () {
          final currentOrder = controller.currentOrder.value;
          if (currentOrder != null &&
              currentOrder.status != HistoryStatus.done) {
            final historyStatus = currentOrder.status;
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Lottie.asset(historyStatus.lottieUrl,
                          width: MediaQuery.of(context).size.shortestSide * 0.8,
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.8,
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
                            onPressed: () => UserController.instance
                                .updateStatusOrder(currentOrder)))
                ],
              ),
            );
          }
          return AppViewLayout(mobileView: TabsMobileView());
        },
      ),
    );
  }
}
