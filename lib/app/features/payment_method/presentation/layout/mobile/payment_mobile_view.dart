import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/payment_method/controllers/payment_controller.dart';
import 'package:ninjafood/app/features/payment_method/presentation/layout/mobile/widgets/payment_button.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class PaymentMethodMobileScreen extends GetView<PaymentController> {
  const PaymentMethodMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage(
      onPressBackButton: controller.onPressBack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding(
            padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
            child: AppText.headlineLarge(
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                text: 'PaymentMethodScreen_Title'.tr),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
            child: AppText.bodyMedium(
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                text: 'PaymentMethodScreen_Description'.tr),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.small),
            child: PaymentButton(
              onPressed: () {},
              imagePayment: AppImageAssets.paypal,
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.small),
            child: PaymentButton(
              onPressed: () {},
              imagePayment: AppImageAssets.visa,
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.small),
            child: PaymentButton(
              onPressed: () {},
              imagePayment: AppImageAssets.payoneer,
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.symmetric(
                horizontal: AppGapSize.medium, vertical: AppGapSize.verylarge),
            child: AppButton.max(
              title: 'PaymentMethodScreen_Next'.tr,
              onPressed: controller.onPressedNext,
            ),
          ),
        ],
      ),
    );
  }
}
