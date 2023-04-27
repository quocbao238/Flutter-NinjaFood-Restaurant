import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/tabs/presentation/view/mobile/drawer_mobile_view/admin_drawer_mobile_view.dart';

class AdminDrawerWidget extends StatelessWidget {
  const AdminDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: const AdminDrawerMobileView(),
    );
  }
}
