import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/category/presentation/layout/mobile/admin_category_view.dart';

class AdminCategoryScreen extends StatelessWidget {
  const AdminCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminCategoryView(),
    );
  }
}
