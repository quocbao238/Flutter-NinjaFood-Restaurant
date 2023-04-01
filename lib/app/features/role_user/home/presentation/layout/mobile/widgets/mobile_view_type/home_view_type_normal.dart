import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/box_special_deal.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/food/popular_food.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/menu/popular_menu.dart';

class HomeViewTypeNormal extends StatelessWidget {
  const HomeViewTypeNormal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
      children: [BoxSpecialDeal(), PopularMenu(), PopularFood()],
    ));
}
