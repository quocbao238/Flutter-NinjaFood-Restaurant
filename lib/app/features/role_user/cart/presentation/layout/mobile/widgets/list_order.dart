import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/cart/controllers/cart_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/layout/mobile/widgets/remove_and_add_box.dart';

class ListOrder extends GetView<CartScreenController> {
  const ListOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
        flex: 2,
        child: Obx(
          () {
            final _lstOrder = controller.lstOrderDetails.toList();
            return ListView.builder(
                itemCount: _lstOrder.length,
                itemBuilder: (context, index) {
                  final _orderDetails = _lstOrder[index];
                  return AppPadding(
                    padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        extentRatio: 0.2,
                        children: [
                          SlidableAction(
                            onPressed: (index) {},
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
                        child: Row(
                          children: [
                            AppPadding.medium(
                                child: Image.asset(_orderDetails.image)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.bodyLarge(text: _orderDetails.name),
                                  AppText.bodyLarge(
                                      text: '\$ ${_orderDetails.price}'),
                                ],
                              ),
                            ),
                            AppPadding(
                              padding:
                                  AppEdgeInsets.only(right: AppGapSize.medium),
                              child: Row(
                                children: [
                                  RemoveAdd(
                                    onTap: () =>
                                        controller.remove(_orderDetails, index),
                                    icon: Icons.remove,
                                    iconColor: ThemeColors.primaryColor,
                                    boxColor: ThemeColors.primaryColor
                                        .withOpacity(0.1),
                                  ),
                                  AppPadding(
                                      padding: AppEdgeInsets.symmetric(
                                          horizontal: AppGapSize.medium),
                                      child: AppText.bodyLarge(
                                          text: '${_orderDetails.count}')),
                                  RemoveAdd(
                                    onTap: () =>
                                        controller.add(_orderDetails, index),
                                    icon: Icons.add,
                                    iconColor: ThemeColors.textDarkColor,
                                    boxColor: ThemeColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
