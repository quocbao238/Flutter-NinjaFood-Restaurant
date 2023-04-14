import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/rate_food/presentation/layout/mobile/rate_food_mobile_view.dart';

class RateFoodScreen extends StatelessWidget {
  const RateFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: RateFoodMobileView(),
    );
  }
}
