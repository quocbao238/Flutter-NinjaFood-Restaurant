import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/home/controllers/admin_home_controller.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/admin_order_item.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminHomeMobileView extends StatelessWidget {
  const AdminHomeMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeController>(
      init: AdminHomeController(),
      builder: (controller) {
        return AppScaffoldBackgroundImage.pattern(
          appBarWidget: CustomAppBar.drawer(title: 'Drawer_Home'.tr),
          body: Obx(
            () {
              final ordersFilter = controller.ordersFilter.toList();
              return AppPadding.medium(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: ordersFilter.length,
                  itemBuilder: (context, index) {
                    return OrderItems(item: ordersFilter[index]);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
