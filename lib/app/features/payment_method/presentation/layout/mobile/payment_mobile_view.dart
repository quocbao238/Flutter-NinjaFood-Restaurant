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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    AppText.headlineLarge(text: 'PaymentMethodScreen_Title'.tr),
                    AppPadding(
                      padding: AppEdgeInsets.only(top: AppGapSize.medium),
                      child: AppText.bodySmall(
                          text: 'PaymentMethodScreen_Description'.tr),
                    ),
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    PaymentButton(
                      onPressed: () {},
                      imagePayment: AppImageAssets.paypal,
                    ),
                    AppPadding(
                      padding:
                          AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                      child: PaymentButton(
                        onPressed: () {},
                        imagePayment: AppImageAssets.visa,
                      ),
                    ),
                    PaymentButton(
                      onPressed: () {},
                      imagePayment: AppImageAssets.payoneer,
                    ),
                  ],
                )
              ],
            ),
          ),
          AppPadding(
            padding: AppEdgeInsets.only(bottom: AppGapSize.large),
            child: AppButton.min(
              title: 'PaymentMethodScreen_Next'.tr,
              onPressed: controller.onPressedNext,
            ),
          ),
        ],
      ),
    );
  }
}
