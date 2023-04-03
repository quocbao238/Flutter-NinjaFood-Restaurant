import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'mobile/forgot_password_mobile_view.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: ForgotPasswordMobileView(),
    );
  }
}
