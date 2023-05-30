import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/category/presentation/layout/mobile/edit_product_mobile_view.dart';

class AdminEditProductScreen extends StatelessWidget {
  const AdminEditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(mobileView: AdminEditProductMobileView());
}
