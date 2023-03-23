import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/splash/presentation/layout/mobile/splash_mobile_layout.dart';
import 'package:ninjafood/app/features/splash/presentation/layout/tablet/splash_tablet_layout.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => AppViewLayout(
        mobileView: SplashMobileLayout(),
        tabletView: SplashTabletLayout(),
      );
}
