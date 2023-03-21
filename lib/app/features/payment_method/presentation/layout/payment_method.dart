import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/payment_method/presentation/layout/mobile/payment_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: PaymentMethodMobileScreen(),
    );
  }
}
