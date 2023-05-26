import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/home/controllers/admin_home_controller.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/admin_home_card_item.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/home_chart_revenue.dart';
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
                      Obx(() {
                        final val = logic.todayRevenue.value;
                        return HomeCardItem(
                          title: 'Today\'s Revenue',
                          value: val,
                          icon: Icons.attach_money_outlined,
                          backgroundColor: context.theme.colorScheme.onPrimary,
                          foregroundColor: context.theme.colorScheme.primary,
                        );
                      }),
                      Obx(() {
                        final val = logic.todayOrder.value;
                        return HomeCardItem(
                          title: 'Today\'s Orders',
                          value: val,
                          icon: Icons.shopping_cart_checkout,
                          backgroundColor: context.theme.colorScheme.onTertiary,
                          foregroundColor: context.theme.colorScheme.tertiary,
                        );
                      }),
                      Obx(() {
                        final val = logic.totalReview.value;
                        return HomeCardItem(
                          title: 'Total Reviews',
                          value: val,
                          icon: Icons.reviews,
                          backgroundColor: context.theme.colorScheme.onSurface,
                          foregroundColor: context.theme.colorScheme.surfaceTint,
                        );
                      }),
                      Obx(() {
                        final lstRevenuesChart = logic.lstRevenuesChart.toList();
                        return ChartViewData(title: 'Revenue Chart', chartData: lstRevenuesChart);
                      }),
                      Obx(() {
                        final lstOrdersChart = logic.lstOrdersChart.toList();
                        return ChartViewData(title: 'Orders Chart', chartData: lstOrdersChart);
                      }),
                    ],
                  ),
                ),
              ));
        });
  }

}
