import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/infrastructure/models/popular_menu_model.dart';

class PopularMenu extends GetView<HomeController> {
  PopularMenu({super.key});

  List<PopularMenuItem> popularMenuList = PopularMenuItem.popularMenuList;

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
                text: 'Popular Menu'.tr,
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
            padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
            child: AppSizeScale(
              ratioWidth: 1,
              ratioHeight: 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMenuList.length,
                itemBuilder: (context, index) {
                  final _listMenu = popularMenuList[index];
                  return AppPadding(
                    padding: AppEdgeInsets.only(right: AppGapSize.medium),
                    child: AppSizeScale(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      ratioWidth: 0.4,
                      child: Column(
                        children: [
                          Image.network(
                            _listMenu.image.toString(),
                            fit: BoxFit.fill,
                          ),
                          AppText.bodyLarge(
                            text: _listMenu.name.toString(),
                            fontWeight: FontWeight.bold,
                          )
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
