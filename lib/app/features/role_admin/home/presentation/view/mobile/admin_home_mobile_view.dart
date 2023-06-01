import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/features/role_admin/home/controllers/admin_home_controller.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/admin_home_card_item.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/home_chart_orders.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/home_chart_revenue.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminHomeMobileView extends StatelessWidget {
  const AdminHomeMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeController>(
        init: AdminHomeController(),
        builder: (logic) {
          return AppScaffoldBackgroundImage.pattern(
              appBarWidget: CustomAppBar.drawer(title: 'Drawer_Home'.tr),
              body: AppPadding.medium(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GetBuilder<DeliveryController>(builder: (controller) {
                        return Obx(() {
                          final val = controller.lstOrderModel
                              .toList()
                              .where((element) =>
                                  element.status != HistoryStatus.done && element.status != HistoryStatus.cancelled)
                              .toList();
                          if (val.length > 0)
                            return HomeCardItem(
                                title: 'Dashboard_Order_Processing'.tr,
                                onPressedIcon: () => logic.onPressedOrderProcess(),
                                value: val.length.toString(),
                                icon: Icons.delivery_dining,
                                backgroundColor: ThemeColors.orangeColor,
                                foregroundColor: ThemeColors.orangeColor);
                          return const SizedBox();
                        });
                      }),
                      Obx(() {
                        final val = logic.todayRevenue.value;
                        return HomeCardItem(
                            title: 'Dashboard_TodayRevenue'.tr,
                            // onPressedIcon: () => logic.onPressedOrderProcess(),
                            value: val,
                            icon: Icons.attach_money_outlined,
                            backgroundColor: context.theme.colorScheme.onPrimary,
                            foregroundColor: context.theme.colorScheme.primary);
                      }),
                      Obx(() {
                        final val = logic.todayOrder.value;
                        return HomeCardItem(
                            title: 'Dashboard_TodayOrders'.tr,
                            onPressedIcon: () => logic.onPressedOrderProcess(),
                            value: val,
                            icon: Icons.shopping_cart_checkout,
                            backgroundColor: context.theme.colorScheme.onTertiary,
                            foregroundColor: context.theme.colorScheme.tertiary);
                      }),
                      Obx(() {
                        final val = logic.totalReview.value;
                        return HomeCardItem(
                            title: 'Dashboard_TotalReviews'.tr,
                            onPressedIcon: () => logic.onPressedReview(),
                            value: val,
                            icon: Icons.reviews,
                            backgroundColor: context.theme.colorScheme.onSurface,
                            foregroundColor: context.theme.colorScheme.surfaceTint);
                      }),
                      Obx(() {
                        final type = logic.revenuesFilterChartType.value;
                        return Obx(() => HomeChartRevenue(
                            title: 'Dashboard_Revenue_Chart'.tr,
                            chartData: logic.lstRevenuesChart.toList(),
                            filterChart: type));
                      }),
                      Obx(() {
                        final type = logic.ordersFilterChartType.value;
                        return Obx(() => HomeChartOrders(
                            title: 'Dashboard_Order_Chart'.tr,
                            chartData: logic.lstOrdersChart.toList(),
                            filterChart: type));
                      }),
                    ],
                  ),
                ),
              ));
        });
  }
}
