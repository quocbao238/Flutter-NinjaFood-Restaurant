import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/success_notification/presentation/layout/mobile/signup_success_mobile_view.dart';

class SuccessNotificationScreen extends StatelessWidget {
  const SuccessNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SuccessNotificationMobileView(),
    );
  }
}
