import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'mobile/sign_up_mobile_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpMobileScreen(),
    );
  }
}
