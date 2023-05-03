part of 'home_mobile_view_type.dart';

class HomeViewTypeNormal extends StatelessWidget {
  const HomeViewTypeNormal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            PromotionDeal(),
            CategoryPopular(),
            ProductPopular(),
          ],
        ),
      );
}
