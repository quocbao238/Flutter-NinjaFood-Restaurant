import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/features/role_admin/tabs/presentation/view/mobile/admin_tab_mobile_view.dart';
import 'package:ninjafood/app/helper/helper.dart';
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
          return (currentOrder != null &&
                  currentOrder.status != HistoryStatus.done)
              ? DeliveryStatusWidget(currentOrder: currentOrder)
              : AppViewLayout(mobileView: TabsMobileView());
        },
      ),
    );
  }
}

class DeliveryStatusWidget extends StatelessWidget {
  const DeliveryStatusWidget({
    super.key,
    required this.currentOrder,
  });

  final OrderModel currentOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.bodyLarge(
                  textAlign: TextAlign.center,
                  text: 'Code_Order'.tr + ':  ',
                  fontWeight: FontWeight.bold),
              AppText.titleSmall(
                  textAlign: TextAlign.center,
                  text: currentOrder.createdAt,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.textRedColor),
            ],
          ),
          AppPadding.small(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.bodyLarge(
                  textAlign: TextAlign.center,
                  text: 'Tổng đơn hàng'.tr + ':  ',
                  fontWeight: FontWeight.bold),
              AppText.titleSmall(
                  textAlign: TextAlign.center,
                  text: formatPriceToVND(currentOrder.total) + ' \đ',
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.textPriceColor),
            ],
          ),
          AppPadding.small(),
          Center(
              child: Lottie.asset(currentOrder.status.lottieUrl,
                  width: MediaQuery.of(context).size.shortestSide * 0.8,
                  height: MediaQuery.of(context).size.shortestSide * 0.8,
                  fit: BoxFit.fill)),
          // AppPadding.small(),
          AppPadding(
            padding: const AppEdgeInsets.symmetric(
                horizontal: AppGapSize.veryLarge, vertical: AppGapSize.large),
            child: AppText.bodyLarge(
                textAlign: TextAlign.center,
                text: currentOrder.status.status.tr,
                fontWeight: FontWeight.bold),
          ),
          if (currentOrder.status == HistoryStatus.delivered ||
              currentOrder.status == HistoryStatus.cancelled)
            AppPadding(
                padding: const AppEdgeInsets.symmetric(
                    horizontal: AppGapSize.veryLarge,
                    vertical: AppGapSize.large),
                child: AppButton.max(
                    title: currentOrder.status == HistoryStatus.delivered
                        ? 'OrderReceived'.tr
                        : 'Dialog_OK'.tr,
                    onPressed: () => UserController.instance
                        .updateStatusOrder(currentOrder)))
        ],
      ),
    );
  }
}
