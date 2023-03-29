import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/payment_method/controllers/payment_controller.dart';
import 'package:ninjafood/app/features/payment_method/presentation/layout/mobile/widgets/payment_button.dart';

class PaymentMethodMobileScreen extends GetView<PaymentController> {
  const PaymentMethodMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      onPressBackButton: controller.onPressBack,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                  child: AppText.headlineSmall(
                      fontWeight: FontWeight.bold, textAlign: TextAlign.start, text: 'PaymentMethodScreen_Title'.tr),
                ),
                AppPadding.medium(
                  child: AppText.bodyMedium(
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      text: 'PaymentMethodScreen_Description'.tr),
                ),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: PaymentMethodButton(
                      onPressed: () {},
                      child: AppPadding.medium(child: AppIcons.paypal()),
                    )),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: PaymentMethodButton(
                      onPressed: () {},
                      child: AppIcons.visa(),
                    )),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: PaymentMethodButton(
                      onPressed: () {},
                      child: AppPadding.medium(child: AppIcons.payOneer()),
                    )),
              ],
            ),
          ),
          AppPadding.regular(
            child: AppButton.max(
              title: 'Next_Button'.tr,
              onPressed: controller.onPressedNext,
            ),
          ),
        ],
      ),
    );
  }
}
