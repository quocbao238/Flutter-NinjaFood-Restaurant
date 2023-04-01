import 'package:flutter/material.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
import 'food_item.dart';

class FoodList extends StatelessWidget {
  final List<ProductModel> foodList;

  const FoodList({Key? key, required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationList(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (context, index, animation) {
        final productItem = foodList[index];
        final _foodName = productItem.name ?? '';
        final _foodPrice = formatPriceToVND(
            productItem.priceRange?.minimumPrice?.finalPrice?.value ?? 0.0);
        final _foodCurrency =
            (productItem.priceRange?.minimumPrice?.finalPrice?.currency ?? '');
        final _foodImage = productItem.image?.url ?? '';
        return FoodItem(
            foodName: _foodName,
            foodPrice: _foodPrice,
            foodCurrency: _foodCurrency,
            foodImage: _foodImage,
            animation: animation);
      },
    );
  }
}
