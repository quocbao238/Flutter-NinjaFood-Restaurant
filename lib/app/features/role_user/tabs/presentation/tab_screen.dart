


import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'layout/mobile/tabs_mobile_view.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: TabsMobileView(),
    );
  }
}
