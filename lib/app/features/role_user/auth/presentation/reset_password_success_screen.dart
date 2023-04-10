import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/layout/mobile/reset_password_mobile_view/reset_password_success_mobile_view.dart';

class SuccessNotificationScreen extends StatelessWidget {
  const SuccessNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SuccessNotificationMobileView(),
    );
  }
}
