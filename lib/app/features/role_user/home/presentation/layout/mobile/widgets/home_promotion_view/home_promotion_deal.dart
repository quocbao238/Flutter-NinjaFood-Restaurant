part of 'home_promotion_view.dart';

class PromotionDeal extends GetView<HomeController> {
  const PromotionDeal({super.key});

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
                  .map((item) => GestureDetector(
                        onTap: () => controller.onPressedPromotionItem(item),
                        child: AppNetworkImage(
                            borderRadius: 16,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                            url: item.thumbnail!),
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
