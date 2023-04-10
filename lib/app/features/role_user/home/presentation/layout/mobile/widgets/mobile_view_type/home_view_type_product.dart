import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/product_view/product_popular.dart';

class HomeViewTypeProduct extends StatelessWidget {
  const HomeViewTypeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(child: ProductPopular());
}
