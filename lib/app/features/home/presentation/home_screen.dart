

import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'layout/mobile/home_mobile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: MobileHomeScreen(),
    );
  }
}
