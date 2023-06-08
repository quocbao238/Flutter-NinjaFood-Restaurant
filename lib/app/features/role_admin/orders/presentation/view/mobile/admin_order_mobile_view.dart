import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/orders/controllers/order_home_controller.dart';
import 'package:ninjafood/app/features/role_admin/orders/presentation/view/mobile/admin_order_item.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminOrderMobileView extends StatelessWidget {
  const AdminOrderMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminOrderController>(
      init: AdminOrderController(),
      builder: (controller) {
        return AppScaffoldBackgroundImage.pattern(
          appBarWidget: Obx(
            () => CustomAppBar.drawer(
              title: controller.currentHistoryStatus.value.json.tr,
              trailingWidget: PopupMenuButton<HistoryStatus>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                        color: ThemeColors.backgroundIconColor(), width: 1)),
                padding: EdgeInsets.zero,
                splashRadius: 18,
                color: Theme.of(context).colorScheme.onPrimary,
                itemBuilder: (BuildContext context) {
                  return controller.filterHistoryStatus
                      .toList()
                      .map((HistoryStatus historyStatus) {
                    return CustomPopupMenuItem<HistoryStatus>(
                      value: historyStatus,
                      showDivider: historyStatus !=
                          controller.filterHistoryStatus.toList().last,
                      child: AppText.bodySmall(
                          text: historyStatus.json.tr,
                          color: controller.currentHistoryStatus.value ==
                                  historyStatus
                              ? historyStatus.color
                              : null),
                      onTap: () {
                        controller.filterOrderByHistoryStatus(historyStatus);
                        Navigator.of(context).pop();
                      },
                    );
                  }).toList();
                },
                onSelected: (HistoryStatus value) {},
                child: SafeArea(
                  child: AppPadding(
                    padding: const AppEdgeInsets.only(
                        top: AppGapSize.medium,
                        left: AppGapSize.paddingMedium,
                        right: AppGapSize.paddingMedium),
                    child: Container(
                      width: 45,
                      height: 45,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: ThemeColors.backgroundIconColor(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppIcons.filter()),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Obx(
            () {
              final ordersFilter = controller.ordersFilter.toList();
              if (ordersFilter.isEmpty)
                return Container(
                  margin: EdgeInsets.only(bottom: kToolbarHeight * 2),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/empty_cart.json'),
                      // AppText.bodyLarge(
                      //     text: 'Cart_Empty'.tr, textAlign: TextAlign.center),
                    ],
                  ),
                );
              return AppPadding(
                padding: AppEdgeInsets.symmetric(
                    horizontal: AppGapSize.medium,
                    vertical: Platform.isIOS
                        ? AppGapSize.none
                        : AppGapSize.paddingMedium),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: ordersFilter.length,
                  itemBuilder: (context, index) =>
                      OrderItems(orderModel: ordersFilter[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
