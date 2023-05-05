import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/order_detail_bottom.dart';
import 'package:ninjafood/app/features/role_user/tabs/presentation/layout/mobile/delivery_process_view.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/history_model.dart';

class DeliveryStatusWidget extends StatefulWidget {
  const DeliveryStatusWidget({
    super.key,
    required this.currentOrder,
  });

  final OrderModel currentOrder;

  @override
  State<DeliveryStatusWidget> createState() => _DeliveryStatusWidgetState();
}

class _DeliveryStatusWidgetState extends State<DeliveryStatusWidget> {
  bool _showListFood = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final subTotal = formatPriceToVND(widget.currentOrder.subTotal) + " VND";
    final serviceFee = widget.currentOrder.serviceFee.toString() + "%";
    final discount = formatPriceToVND(widget.currentOrder.discount) + " VND";
    final total = formatPriceToVND(widget.currentOrder.total) + " VND";
    final isDone = (widget.currentOrder.status == HistoryStatus.delivered ||
        widget.currentOrder.status == HistoryStatus.cancelled);

    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: !isDone
          ? AppButtonBack(
              onPressed: () =>
                  DeliveryController.instance.onChangeDeliveryStatus(),
            )
          : AppPadding(
              padding: const AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  left: AppGapSize.paddingMedium,
                  right: AppGapSize.paddingMedium),
              child: SizedBox(width: 45, height: 45)),
      body: AppPadding.medium(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.bodyLarge(
                      textAlign: TextAlign.start,
                      text: 'Code_Order'.tr + ':  ',
                      fontWeight: FontWeight.bold),
                  AppText.titleSmall(
                      textAlign: TextAlign.start,
                      text: widget.currentOrder.createdAt,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.textRedColor)
                ],
              ),
              AppPadding.small(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.bodyLarge(
                      textAlign: TextAlign.start,
                      text: 'Tổng đơn hàng'.tr + ':  ',
                      fontWeight: FontWeight.bold),
                  AppText.titleSmall(
                      textAlign: TextAlign.start,
                      text: formatPriceToVND(widget.currentOrder.total) + ' \đ',
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.textPriceColor),
                ],
              ),
              Center(
                  child: AppPadding(
                padding: AppEdgeInsets.symmetric(
                  vertical: isDone ? AppGapSize.veryLarge : AppGapSize.none,
                ),
                child: Lottie.asset(widget.currentOrder.status.lottieUrl,
                    width: MediaQuery.of(context).size.height * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fill),
              )),
              if (widget.currentOrder.status != HistoryStatus.cancelled)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ProcessTimelinePage(currentOrder: widget.currentOrder),
                ),
              AppPadding(
                padding: const AppEdgeInsets.symmetric(
                    horizontal: AppGapSize.medium, vertical: AppGapSize.medium),
                child: Center(
                  child: AppText.bodyLarge(
                      textAlign: TextAlign.center,
                      text: widget.currentOrder.status.status.tr,
                      color: ThemeColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                  color: ThemeColors.textDarkColor.withOpacity(0.1),
                  thickness: 1,
                  height: AppGapSize.veryLarge.size),
              if (!_showListFood && !isDone)
                AppButton.max(
                    title: 'Xem chi tiết đơn hàng'.tr,
                    onPressed: () =>
                        setState(() => _showListFood = !_showListFood)),
              if (_showListFood)
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: widget.currentOrder.carts.length,
                  itemBuilder: (context, index) {
                    final _cartDetail = widget.currentOrder.carts[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: AppGapSize.small.size),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isDarkMode
                              ? ThemeColors.backgroundTextFormDark()
                              : Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: AppPadding.small(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppPadding(
                                padding:
                                    AppEdgeInsets.only(right: AppGapSize.small),
                                child: SizedBox(
                                  width: 84,
                                  height: 84,
                                  child: AppNetworkImage(
                                      borderRadius: 8,
                                      height: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.2,
                                      width: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.2,
                                      url:
                                          _cartDetail.productModel.image?.url ??
                                              ''),
                                ),
                              ),
                              SizedBox(width: AppGapSize.medium.size),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AppText.bodyLarge(
                                        text:
                                            _cartDetail.productModel.name ?? '',
                                        textAlign: TextAlign.left),
                                    AppText.titleMedium(
                                        text:
                                            '${_cartDetail.productModel.getPrice} ${_cartDetail.productModel.currency}',
                                        color: ThemeColors.textPriceColor),
                                  ],
                                ),
                              ),
                              AppPadding(
                                padding: AppEdgeInsets.symmetric(
                                    horizontal: AppGapSize.medium),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer
                                          .withOpacity(0.6),
                                      shape: BoxShape.circle),
                                  child: AppPadding.medium(
                                    child: AppText.bodyLarge(
                                      text: '${_cartDetail.quantity}',
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              if (_showListFood)
                AppPadding(
                  padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: Column(
                    children: [
                      OrderTitleValueText(
                          title: 'Cart_Sub_Total'.tr, value: subTotal),
                      OrderTitleValueText(
                          title: 'Cart_Total_Tax'.tr, value: serviceFee),
                      OrderTitleValueText(
                          title: 'Cart_Total_Discount'.tr, value: discount),
                      OrderTitleValueText(
                          title: 'Cart_Total_Price'.tr, value: total),
                    ],
                  ),
                ),
              if (_showListFood && !isDone)
                AppPadding(
                  padding: AppEdgeInsets.only(top: AppGapSize.medium),
                  child: AppButton.max(
                      title: 'Ẩn chi tiết đơn hàng'.tr,
                      onPressed: () {
                        setState(() {
                          _showListFood = !_showListFood;
                        });
                      }),
                ),
              if (isDone)
                AppPadding(
                    padding: const AppEdgeInsets.symmetric(
                        // horizontal: AppGapSize.veryLarge,
                        vertical: AppGapSize.large),
                    child: AppButton.max(
                        title: widget.currentOrder.status ==
                                HistoryStatus.delivered
                            ? 'OrderReceived'.tr
                            : 'Dialog_OK'.tr,
                        onPressed: () => UserController.instance
                            .updateStatusOrder(widget.currentOrder)))
            ],
          ),
        ),
      ),
    );
  }
}
