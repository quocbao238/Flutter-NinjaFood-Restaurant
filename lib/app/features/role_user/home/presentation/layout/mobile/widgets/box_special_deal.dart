import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';

class BoxSpecialDeal extends GetView<HomeController> {
  const BoxSpecialDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
      child: Obx(() {
        final promotions = controller.promotions;
        if (promotions.isEmpty) return SizedBox();
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    controller.currentIndexPromotion.value = index;
                  }),
              items: promotions
                  .map((item) => ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(item.thumbnail!, fit: BoxFit.fill),
                      ))
                  .toList(),
            ),
            AppPadding.small(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: promotions.map(
                (image) {
                  int index = promotions.indexOf(image);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndexPromotion.value == index
                          ? ThemeColors.primaryColor
                          : Colors.grey,
                    ),
                  );
                },
              ).toList(), // this was the part the I had to add
            ),
          ],
        );
      }),
    );
  }
}
