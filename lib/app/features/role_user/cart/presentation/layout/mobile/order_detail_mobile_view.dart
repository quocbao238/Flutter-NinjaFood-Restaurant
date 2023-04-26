import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/cart/controllers/cart_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/order_detail_bottom.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/order_detail_body.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class OrderDetailsMobileView extends GetView<CartScreenController> {
  const OrderDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final tapController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget:
            AppButtonDrawer(onPressed: () => tapController.toggleDrawer()),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                  child: AppText.headlineMedium(
                      text: 'Cart_Title'.tr, fontWeight: FontWeight.bold)),
              OrderDetailBodyView(),
              OrderDetailBottom(),
              AppPadding(
                padding: AppEdgeInsets.only(top: AppGapSize.small),
                child: Obx(
                  () {
                    return Center(
                      child: AnimationButton(
                          onPressed: () => controller.onPressedPlaceMyOrder(),
                          textDone: 'Cart_Order_Success'.tr,
                          onDone: () => controller.onPressedDone(),
                          textLoading: 'Cart_Oder_Loading'.tr,
                          textButton: 'Cart_Order_Now'.tr,
                          loading: controller.loading.value),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
