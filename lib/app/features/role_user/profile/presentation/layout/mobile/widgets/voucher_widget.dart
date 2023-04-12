import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';

class VoucherWidget extends GetView<HomeController> {
  const VoucherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppPadding(
      padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            AppPadding.medium(child: AppIcons.voucher()),
            Obx(() {
              final lstVoucher = controller.promotions;
              return AppText.bodyLarge(text: 'You Have ${lstVoucher.length} Voucher', fontWeight: FontWeight.w400);
            })
          ],
        ),
      ),
    );
  }
}
