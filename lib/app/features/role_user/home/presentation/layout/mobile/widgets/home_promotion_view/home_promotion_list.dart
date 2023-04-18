part of 'home_promotion_view.dart';


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
          child: AppAnimationList(
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
