import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/popular_food.dart';

class HomeViewTypeFoods extends StatelessWidget {
  const HomeViewTypeFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(child: PopularFood());
}
