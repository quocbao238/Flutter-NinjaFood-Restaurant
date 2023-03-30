import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/box_special_deal.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/popular_food.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/popular_menu.dart';

class HomeViewTypeNormal extends StatelessWidget {
  const HomeViewTypeNormal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BoxSpecialDeal(),
          PopularMenu(),
          PopularFood(),
        ],
      ),
    );
  }
}
