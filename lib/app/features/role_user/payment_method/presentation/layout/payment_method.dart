import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'mobile/payment_mobile_view.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: PaymentMethodMobileScreen(),
    );
  }
}
