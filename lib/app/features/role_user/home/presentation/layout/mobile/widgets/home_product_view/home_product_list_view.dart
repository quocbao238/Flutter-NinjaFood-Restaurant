part of 'home_product_view.dart';

class ProductList extends GetView<HomeController> {
  final List<ProductModel> productList;

  const ProductList({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppAnimationList(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index, animation) =>
          ProductItem(productItem: productList[index], animation: animation),
    );
}
