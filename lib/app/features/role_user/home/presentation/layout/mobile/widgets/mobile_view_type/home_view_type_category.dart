import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/category_view/category_view.dart';

class HomeViewTypeCategory extends StatelessWidget {
  const HomeViewTypeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(child: CategoryPopular());
}
