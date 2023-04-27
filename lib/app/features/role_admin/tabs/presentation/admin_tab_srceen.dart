


import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/tabs/presentation/view/mobile/admin_tab_mobile_view.dart';

class AdminTabsScreen extends StatelessWidget {
  const AdminTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminTabsMobileView(),
    );
  }
}
