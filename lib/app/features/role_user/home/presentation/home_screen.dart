import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'layout/mobile/home_mobile_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(mobileView: HomeMobileView());
}
