import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/promotion_view/promotion_deal.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/category_view/category_view.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/product_view/product_popular.dart';

class HomeViewTypeNormal extends StatelessWidget {
  const HomeViewTypeNormal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
      children: [PromotionDeal(), CategoryPopular(), ProductPopular()],
    ));
}
