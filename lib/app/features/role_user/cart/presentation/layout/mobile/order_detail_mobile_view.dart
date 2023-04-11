import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/box_detail_price.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/list_order.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class OrderDetailsMobileView extends GetView {
  const OrderDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final tapController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: AppButtonDrawer(
          onPressed: () => tapController.toggleDrawer(),
        ),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                child: AppText.headlineMedium(
                    text: 'Order details', fontWeight: FontWeight.bold),
              ),
              ListOrder(),
              BoxDetailprice(),
            ],
          ),
        ));
  }
}
