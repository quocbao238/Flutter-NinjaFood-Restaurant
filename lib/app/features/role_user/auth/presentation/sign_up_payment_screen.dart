import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'layout/mobile/sign_up_payment_mobile_view/sign_up_payment_mobile_view.dart';

class SignUpPaymentScreen extends StatelessWidget {
  const SignUpPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpPaymentMobileView(),
    );
  }
}
