import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/popular_food.dart';

class HomeViewTypeFoods extends StatelessWidget {
  const HomeViewTypeFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: PopularFood());
  }
}
