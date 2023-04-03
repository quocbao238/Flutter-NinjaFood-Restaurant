import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/menu/presentation/layout/mobile/menu_mobile_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: const MenuMobileScreen(),
    );
  }
}
