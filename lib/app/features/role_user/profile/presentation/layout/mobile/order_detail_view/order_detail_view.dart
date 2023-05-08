import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/order_detail_bottom.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class OrderDetailsMobileView extends StatefulWidget {
  final OrderModel orderModel;

  const OrderDetailsMobileView({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<OrderDetailsMobileView> createState() => _OrderDetailsMobileViewState();
}

class _OrderDetailsMobileViewState extends State<OrderDetailsMobileView> {
  late OrderModel _orderModel;

  @override
  void initState() {
    _orderModel = widget.orderModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final subTotal = formatPriceToVND(widget.orderModel.subTotal) + " VND";
    final serviceFee = _orderModel.serviceFee.toString() + "%";
    final discount = formatPriceToVND(_orderModel.discount) + " VND";
    final total = formatPriceToVND(_orderModel.total) + " VND";
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.back(
          title: 'Order_Detail_Title'.tr,
          trailingWidget: _orderModel.status != HistoryStatus.done
              ? null
              : AppPadding(
                  padding: const AppEdgeInsets.only(
                      top: AppGapSize.paddingMedium,
                      left: AppGapSize.paddingMedium,
                      right: AppGapSize.paddingMedium),
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.red,
                      onPressed: widget.orderModel.isRating
                          ? null
                          : () async => await Get.toNamed(
                                      AppRouteProvider.ratingScreen,
                                      arguments: widget.orderModel)!
                                  .then((value) {
                                if (value != null) {
                                  setState(() => _orderModel.isRating = true);
                                }
                              }),
                      icon: Icon(
                        // Icons.star_rounded,
                        widget.orderModel.isRating
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: ThemeColors.textPriceColor,
                      ),
                    ),
                  ),
                ),
        ),
        body: AppPadding.medium(
          child: Column(
            children: [
              if (widget.orderModel.status != HistoryStatus.done)
                Center(
                    child: Lottie.asset(widget.orderModel.status.lottieUrl,
                        width: MediaQuery.of(context).size.height * 0.15,
                        height: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.fill)),
              if (widget.orderModel.status != HistoryStatus.done)
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.medium,
                      vertical: AppGapSize.medium),
                  child: Center(
                    child: AppText.bodyLarge(
                        textAlign: TextAlign.center,
                        text: widget.orderModel.status.status.tr,
                        color: ThemeColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              if (widget.orderModel.status != HistoryStatus.done)
                AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                  child: Divider(
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .color!
                          .withOpacity(0.4),
                      thickness: 1),
                ),
              Expanded(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: widget.orderModel.carts.length,
                  itemBuilder: (context, index) {
                    final _cartDetail = widget.orderModel.carts[index];
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
              ),
              Card(
                color: ThemeColors.primaryColor.withOpacity(0.8),
                child: AppPadding(
                  padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: Column(
                    children: [
                      OrderTitleValueText(
                          title: 'Cart_Sub_Total'.tr, value: subTotal),
                      OrderTitleValueText(
                          title: 'Cart_Total_Tax'.tr, value: serviceFee),
                      OrderTitleValueText(
                          title: 'Cart_Total_Discount'.tr, value: discount),
                      AppPadding(
                        padding: AppEdgeInsets.symmetric(
                            horizontal: AppGapSize.small),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText.bodyLarge(
                              textAlign: TextAlign.start,
                              text: 'Cart_Total_Price'.tr + ':  ',
                              fontWeight: FontWeight.bold,
                              color: ThemeColors.textDarkColor,
                            ),
                            Expanded(
                              child: AppText.titleSmall(
                                  textAlign: TextAlign.end,
                                  text: total,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.textPriceColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // AppButton.min(
              //   title: 'Review Order',
              //   onPressed: () {},
              // )
            ],
          ),
        ));
  }
}
