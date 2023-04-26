import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
      appBarWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppButtonDrawer(onPressed: () => tapController.toggleDrawer()),
          Expanded(
            child: AppPadding(
              padding: AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  bottom: AppGapSize.regular,
                  right: AppGapSize.paddingMedium),
              child: AppText.headlineMedium(
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                  text: 'Cart_Title'.tr),
            ),
          ),
          AppPadding(
              padding: const AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  left: AppGapSize.paddingMedium,
                  right: AppGapSize.paddingMedium,
                  bottom: AppGapSize.regular),
              child: SizedBox(width: 45, height: 45)),
        ],
      ),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Obx(
          () {
            final _listCarts = controller.lstCarts;
            if (_listCarts.isEmpty) {
              return Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                        'https://assets10.lottiefiles.com/private_files/lf30_oqpbtola.json'),
                    AppText.bodyLarge(
                        text: 'Cart_Empty'.tr, textAlign: TextAlign.center),
                    AppPadding.small(),
                    AppButton.min(
                        title: 'Cart_Go_To_Home'.tr,
                        onPressed: () {
                          tapController.onChangeToHomeScreen();
                        })
                  ],
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            );
          },
        ),
      ),
    );
  }
}
