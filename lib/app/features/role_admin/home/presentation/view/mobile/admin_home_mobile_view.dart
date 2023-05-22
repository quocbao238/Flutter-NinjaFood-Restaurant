import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/admin_home_card_item.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/chart_data/bar_chart_group_data.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/home_chart_revenue.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminHomeMobileView extends StatelessWidget {
  const AdminHomeMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.drawer(title: 'Drawer_Home'.tr),
        body: AppPadding.medium(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeCardItem(
                  title: 'Today\'s Revenue',
                  value: _convertDoubleToDollar(1256.00),
                  icon: Icons.attach_money_outlined,
                  backgroundColor: context.theme.colorScheme.onPrimary,
                  foregroundColor: context.theme.colorScheme.primary,
                ),
                HomeCardItem(
                  title: 'Today\'s Orders',
                  value: '56',
                  icon: Icons.shopping_cart_checkout,
                  backgroundColor: context.theme.colorScheme.onTertiary,
                  foregroundColor: context.theme.colorScheme.tertiary,
                ),
                HomeCardItem(
                  title: 'Total Reviews',
                  value: '256',
                  icon: Icons.reviews,
                  backgroundColor: context.theme.colorScheme.onSurface,
                  foregroundColor: context.theme.colorScheme.surfaceTint,
                ), ChartViewData(
                    title: 'Revenue Chart',
                    chartData: ChartData.fakeDataWeek()),
                ChartViewData(
                    title: 'Revenue Chart',
                    chartData: ChartData.fakeDataMonth()),
                AppPadding.medium(),
                ChartViewData(
                    title: 'Orders Charts',
                    chartData: ChartData.fakeDataYear()),
              ],
            ),
          ),
        ));
  }

  String _convertDoubleToDollar(double value) {
    return '\$${value.toStringAsFixed(2)}';
  }
}
