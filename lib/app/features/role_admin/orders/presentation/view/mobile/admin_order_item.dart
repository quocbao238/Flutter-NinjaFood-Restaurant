import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/orders/controllers/order_home_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

class OrderItems extends StatelessWidget {
  final OrderModel orderModel;

  const OrderItems({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final _image = orderModel.carts.first.productModel.image?.url ?? '';
    final totalPrice = formatPriceToVND(orderModel.total) + ' \đ';
    final createAt = convertTimeStamp(orderModel.createdAt);
    final adminOrderController = Get.find<AdminOrderController>();

    final listStatus =
        adminOrderController.getListStatus(orderModel: orderModel);

    return AppPadding(
      padding: AppEdgeInsets.only(bottom: AppGapSize.small),
      child: SizedBox(
        height: MediaQuery.of(context).size.shortestSide * 0.25,
        child: AppPadding(
          padding: AppEdgeInsets.only(bottom: AppGapSize.small),
          child: GestureDetector(
            onTap: () => Get.toNamed(AppRouteProvider.orderDetailScreen,
                arguments: orderModel),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.25),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
                color: isDarkMode
                    ? ThemeColors.backgroundTextFormDark()
                    : Theme.of(context).colorScheme.onPrimary,
              ),
              child: AppPadding.small(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AppNetworkImage(
                            url: _image,
                            width:
                                MediaQuery.of(context).size.shortestSide * 0.2,
                            height:
                                MediaQuery.of(context).size.shortestSide * 0.2,
                            fit: BoxFit.fill)),
                    Expanded(
                      child: AppPadding(
                        padding: AppEdgeInsets.only(left: AppGapSize.medium),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText.bodyMedium(
                                            text: 'Code_Order'.tr +
                                                ' ${orderModel.createdAt}',
                                            maxLines: 1,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.left),
                                        AppText.bodySmall(
                                            text: orderModel.createdAt,
                                            color: ThemeColors.textRedColor,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.left),
                                      ],
                                    ),
                                  ),
                                  AppPadding(
                                    padding: AppEdgeInsets.only(
                                        left: AppGapSize.medium),
                                    child: AppText.bodyLarge(
                                        text: totalPrice,
                                        color: ThemeColors.textPriceColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AppPadding(
                                      padding: AppEdgeInsets.only(
                                          right: AppGapSize.small),
                                      child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: AppText.bodySmall(
                                              text: createAt.trim(),
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeColors.labelDarkColor,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis)),
                                    ),
                                  ),
                                  PopupMenuButton<HistoryStatus>(
                                    enabled:
                                        orderModel.status != HistoryStatus.done,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(
                                            color: orderModel.status.color,
                                            width: 1)),
                                    padding: EdgeInsets.zero,
                                    splashRadius: 18,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    itemBuilder: (BuildContext context) {
                                      return listStatus
                                          .map((HistoryStatus historyStatus) {
                                        return CustomPopupMenuItem<
                                            HistoryStatus>(
                                          value: historyStatus,
                                          showDivider:
                                              historyStatus != listStatus.last,
                                          child: AppText.bodySmall(
                                              text:
                                                  historyStatus.adminStatus.tr),
                                          onTap: () {
                                            adminOrderController
                                                .updateStatusOrder(
                                                    orderModel: orderModel,
                                                    status: historyStatus);
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      }).toList();
                                    },
                                    onSelected: (HistoryStatus value) {},
                                    child: Container(
                                      constraints: BoxConstraints(
                                          minWidth: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.2),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(0.1),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2)),
                                            ],
                                            border: Border.all(
                                                color: orderModel.status.color,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: orderModel.status.color
                                                .withOpacity(0.05)),
                                        child: AppPadding.small(
                                          child: AppText.labelSmall(
                                              text: orderModel.status.json.tr,
                                              fontWeight: FontWeight.w400,
                                              color: orderModel.status.color),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPopupMenuItem<T> extends PopupMenuEntry<T> {
  final T value;
  final bool showDivider;
  final Widget child;
  final VoidCallback? onTap;

  CustomPopupMenuItem(
      {required this.value,
      required this.child,
      this.onTap,
      this.showDivider = true});

  @override
  State createState() => _CustomPopupMenuItemState<T>();

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) {
    return value == this.value;
  }
}

class _CustomPopupMenuItemState<T> extends State<CustomPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: widget.child,
          onTap: () => widget.onTap?.call(),
        ),
        if (widget.showDivider) Divider(height: 1)
      ],
    );
  }
}
