import 'package:flutter/material.dart';
import 'package:ninjafood/app/base_widget/base_widget.dart';
import 'package:ninjafood/app/features/auth/presentation/onboard/devices/onboard_mobile_view.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewLayout(
      mobileView: OnboardMobileScreen(),
    );
  }
}
