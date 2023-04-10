import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/food_detail/controller/food_detail_controller.dart';
import 'package:ninjafood/app/features/role_user/food_detail/presentation/layout/mobile/widgets/food_detail_appbar.dart';
import 'package:ninjafood/app/features/role_user/food_detail/presentation/layout/mobile/widgets/food_detail_description.dart';

class FoodDetailMobileView extends GetView<FoodDetailController> {
  const FoodDetailMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 64),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: FoodDetailAppbar(
                      title: AppButtonBack(onPressed: () => Get.back()),
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                      backgroundImage:
                          CachedNetworkImage(imageUrl: controller.currentProduct.image?.url ?? '', fit: BoxFit.cover)),
                ),
                FoodDetail(),
              ],
            ),
          ),
          Positioned(
              bottom: 8,
              left: AppGapSize.medium.size,
              right: AppGapSize.medium.size,
              child: AppButton.max(
                title: 'Add To Chart',
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
