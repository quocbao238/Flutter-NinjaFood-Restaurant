import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/infrastructure/models/popular_food_model.dart';

class PopularFood extends GetView {
  PopularFood({super.key});

  List<PopularFoodItem> popularFoodList = PopularFoodItem.popularFoodList;

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodyLarge(
                text: 'Popular Food'.tr,
                fontWeight: FontWeight.bold,
              ),
              AppText.bodySmall(
                text: 'View More'.tr,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFF7C32),
              ),
            ],
          ),
          AppPadding(
            padding: AppEdgeInsets.only(top: AppGapSize.medium),
            child: AppSizeScale(
              ratioWidth: 1,
              ratioHeight: 0.35,
              child: ListView.builder(
                itemCount: popularFoodList.length,
                itemBuilder: (context, index) {
                  final _listMenu = popularFoodList[index];
                  return AppPadding(
                    padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                    child: AppSizeScale(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      ratioHeight: 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(_listMenu.image.toString(),
                              fit: BoxFit.fill),
                          AppPadding(
                              padding: AppEdgeInsets.only(
                                  left: AppGapSize.medium,
                                  right: AppGapSize.veryLarge),
                              child: AppText.bodyLarge(
                                  text: _listMenu.name.toString())),
                          AppText.titleLarge(
                              text: '\$${_listMenu.price.toString()}',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFF7C32)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
