import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/food_detail/controller/food_detail_controller.dart';
import 'package:ninjafood/app/features/role_user/food_detail/infrastructure/models/rating_n_cmt_models.dart';
import 'package:ninjafood/app/features/role_user/food_detail/presentation/layout/mobile/widgets/food_detail_appbar.dart';
import 'package:ninjafood/app/features/role_user/food_detail/presentation/layout/mobile/widgets/food_detail_description.dart';

class FoodDetailMobileView extends GetView<FoodDetailController> {
  const FoodDetailMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RateAndCmt> personRating = RateAndCmt.personRating;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: FoodDetailAppbar(
                  title: AppButtonBack(
                    onPressed: (){},
                  ),
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                  backgroundImage: AssetImage('assets/icons/food4.png'),
                ),
              ),
              FoodDetail(personRating: personRating),
            ],
          ),
          Positioned(
              bottom: 0,
              left: AppGapSize.medium.size,
              right: AppGapSize.medium.size,
              child: AppButton.max(title: 'Add To Chart', onPressed: (){},))
        ],
      ),
    );
  }
}




