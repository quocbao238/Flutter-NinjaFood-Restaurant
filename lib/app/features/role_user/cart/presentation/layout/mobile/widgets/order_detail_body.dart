import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/cart/controllers/cart_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/order_detail_item_count.dart';

class OrderDetailBodyView extends GetView<CartScreenController> {
  const OrderDetailBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final _listCarts = controller.lstCarts.toList();
    return Expanded(
        flex: 2,
        child: ListView.builder(
          itemCount: _listCarts.length,
          itemBuilder: (context, index) {
            final _cartDetail = _listCarts[index];
            return AppPadding(
              padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  extentRatio: 0.2,
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          controller.onPressedRemoveItem(index),
                      backgroundColor: ThemeColors.orangeColor,
                      borderRadius: BorderRadius.circular(22),
                      icon: Icons.delete_outline_rounded,
                    ),
                  ],
                ),
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
                          padding: AppEdgeInsets.only(right: AppGapSize.small),
                          child: SizedBox(
                            width: 84,
                            height: 84,
                            child: AppNetworkImage(
                                borderRadius: 8,
                                height:
                                    MediaQuery.of(context).size.shortestSide *
                                        0.2,
                                width:
                                    MediaQuery.of(context).size.shortestSide *
                                        0.2,
                                url: _cartDetail.productModel.image?.url ?? ''),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AppText.bodyLarge(
                                text: _cartDetail.productModel.name ?? '',
                                textAlign: TextAlign.left,
                              ),
                              AppText.titleMedium(
                                  text:
                                      '${_cartDetail.productModel.getPrice} ${_cartDetail.productModel.currency}',
                                  color: ThemeColors.textPriceColor),
                            ],
                          ),
                        ),
                        AppPadding(
                          padding: AppEdgeInsets.only(left: AppGapSize.medium),
                          child: Row(
                            children: [
                              OrderDetailItemCount(
                                  onTap: () => controller.decreaseQuantity(
                                      _cartDetail, index),
                                  icon: Icons.remove,
                                  iconColor: ThemeColors.primaryColor,
                                  boxColor: ThemeColors.primaryColor
                                      .withOpacity(0.1)),
                              AppPadding(
                                  padding: AppEdgeInsets.symmetric(
                                      horizontal: AppGapSize.medium),
                                  child: AppText.bodyLarge(
                                      text: '${_cartDetail.quantity}')),
                              OrderDetailItemCount(
                                  onTap: () => controller.increaseQuantity(
                                      _cartDetail, index),
                                  icon: Icons.add,
                                  iconColor: ThemeColors.textDarkColor,
                                  boxColor: ThemeColors.primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
