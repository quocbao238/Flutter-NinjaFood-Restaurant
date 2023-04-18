part of 'home_product_view.dart';


class ProductList extends GetView<HomeController> {
  final List<ProductModel> productList;
  const ProductList({Key? key, required this.productList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppAnimationList(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index, animation) {
        final productItem = productList[index];
        final _foodName = productItem.name ?? '';
        final _foodPrice = formatPriceToVND(productItem.priceRange?.minimumPrice?.finalPrice?.value ?? 0.0);
        final _foodCurrency = (productItem.priceRange?.minimumPrice?.finalPrice?.currency ?? '');
        final _foodImage = productItem.image?.url ?? '';
        return ProductItem(
            onTap: () => controller.onPressedFoodItem(productItem),
            foodName: _foodName,
            foodPrice: _foodPrice,
            foodCurrency: _foodCurrency,
            foodImage: _foodImage,
            animation: animation);
      },
    );
  }
}
