import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/presentation/tab_drawer_menus.dart';
import 'package:ninjafood/app/models/history_model.dart';

class TabsMobileView extends GetView<TabsController> {
  const TabsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Obx(
      () {
        final loading = controller.loading.value;
        return Stack(
          children: [
            AppScaffoldBackgroundImage.splash(
              isLoading: loading,
              body: ZoomDrawer(
                  controller: controller.zoomDrawerController,
                  androidCloseOnBackTap: true,
                  style: DrawerStyle.defaultStyle,
                  menuScreenTapClose: true,
                  menuScreen: DrawerWidget(),
                  mainScreen: Obx(() => IndexedStack(
                      index: controller.currentMenuItem.value.index,
                      children: controller.screens)),
                  shadowLayer1Color: Get.isDarkMode
                      ? ThemeColors.shadowLayer1ColorDark()
                      : ThemeColors.shadowLayer1Color,
                  shadowLayer2Color: Get.isDarkMode
                      ? ThemeColors.shadowLayer2ColorDark()
                      : ThemeColors.shadowLayer2Color,
                  borderRadius: 32.0,
                  showShadow: true,
                  angle: -8.0,
                  slideWidth: MediaQuery.of(context).size.width * 0.8),
            ),
            Obx(() {
              final currentOrder =
                  DeliveryController.instance.currentOrder.value;
              if (currentOrder != null &&
                  currentOrder.status != HistoryStatus.done) {
                // Animation for delivery status
                return Positioned(
                    bottom: 64,
                    right: 0,
                    child: Card(
                      elevation: 8,
                      shadowColor: Theme.of(context).colorScheme.shadow,
                      color: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(64),
                              bottomLeft: Radius.circular(64))),
                      child: DeliveryWidget(currentOrder: currentOrder),
                    ));
              }
              return SizedBox();
            }),
          ],
        );
      },
    );
  }
}

class DeliveryWidget extends StatefulWidget {
  final OrderModel currentOrder;

  const DeliveryWidget({Key? key, required this.currentOrder})
      : super(key: key);

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.2,
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: GestureDetector(
        onTap: () => setState(() => _show = !_show),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppPadding(
              padding: AppEdgeInsets.only(left: AppGapSize.medium),
              child: Lottie.asset(
                widget.currentOrder.status.lottieUrl,
                width: MediaQuery.of(context).size.height * 0.1,
                height: MediaQuery.of(context).size.height * 0.1,
                fit: BoxFit.fill,
              ),
            ),
            if (_show)
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      DeliveryController.instance.onChangeDeliveryStatus(),
                  child: AppText.bodyMedium(
                    text: widget.currentOrder.status.status.tr,
                    maxLines: 2,
                  ),
                ),
              ),
            if (_show)
              IconButton(
                onPressed: () => setState(() => _show = false),
                icon: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
