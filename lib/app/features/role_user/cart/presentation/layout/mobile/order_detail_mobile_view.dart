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
        appBarWidget: AppButtonDrawer(onPressed: () => tapController.toggleDrawer()),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                  child: AppText.headlineMedium(text: 'Order details', fontWeight: FontWeight.bold)),
              OrderDetailBodyView(),
              OrderDetailBottom(),
              AppPadding(
                padding: AppEdgeInsets.only(top: AppGapSize.small),
                child: Obx(() {
                  final loading = controller.loading.value;
                  return Center(
                    child: AnimationButton(
                        onPressed: () => controller.onPressedPlaceMyOrder(),
                        textDone: 'Done',
                        onDone: () => controller.onPressedDone(),
                        textLoading: 'Loading...',
                        textButton: 'Place my orders',
                        loading: controller.loading.value),
                  );
                  return !controller.loading.value
                      ? Center(
                          child: CircularProgressIndicator(
                          color: ThemeColors.primaryColor,
                        ))
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: kToolbarHeight,
                          child: ElevatedButton(
                            onPressed: () => controller.onPressedPlaceMyOrder(),
                            child: FittedBox(
                              child: Text('Place My Order',
                                  style: ThemeText.bodyLarge
                                      .copyWith(fontWeight: FontWeight.bold, color: ThemeColors.primaryColor)),
                            ),
                            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                  backgroundColor: MaterialStateProperty.all(ThemeColors.textDarkColor),
                                ),
                          ),
                        );
                }),
              ),
            ],
          ),
        ));
  }
}
