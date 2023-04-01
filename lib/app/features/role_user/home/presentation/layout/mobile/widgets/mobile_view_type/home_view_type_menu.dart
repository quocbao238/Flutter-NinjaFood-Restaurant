import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/menu/popular_menu.dart';

class HomeViewTypeMenus extends StatelessWidget {
  const HomeViewTypeMenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(child: PopularMenu());
}
