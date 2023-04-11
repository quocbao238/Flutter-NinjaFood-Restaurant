import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/promotion_view/promotion_item.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';

class PromotionListView extends GetView<HomeController> {
  const PromotionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final lstPromotions = controller.promotions;
        if (lstPromotions.isEmpty) {
          return const SizedBox();
        }
        return AppPadding.medium(
          child: AnimationList(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: lstPromotions.length,
            shrinkWrap: true,
            itemBuilder: (context, index, animation) => AnimationItem(
              animation: animation,
              child: PromotionItem(
                promotion: lstPromotions[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
