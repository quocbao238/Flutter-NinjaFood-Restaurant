import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/features/role_admin/tabs/presentation/view/mobile/admin_tab_mobile_view.dart';
import 'package:ninjafood/app/features/role_user/tabs/presentation/delivery_status.dart';
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
          final disableShowDelivery = controller.disableShowDelivery.value;
          return (currentOrder != null &&
                  currentOrder.status != HistoryStatus.done &&
                  !disableShowDelivery)
              ? DeliveryStatusWidget(currentOrder: currentOrder)
              : AppViewLayout(mobileView: TabsMobileView());
        },
      ),
    );
  }
}
