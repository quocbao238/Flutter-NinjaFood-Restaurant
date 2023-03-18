import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/onboard/presentation/layout/mobile/onboard_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: OnboardMobileScreen(),
    );
  }
}
