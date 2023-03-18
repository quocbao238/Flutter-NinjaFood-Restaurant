import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/sign_up/presentation/layout/mobile/sign_up_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpMobileScreen(),
    );
  }
}
