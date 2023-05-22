import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'ProductDetailController';

class ProductDetailScreenController extends BaseController {
  late Rx<ProductModel> currentProduct;
  final UserController userController = UserController.instance;
  final RxList<CartModel> lstCurrentCart = <CartModel>[].obs;
  final RxBool isInCarts = false.obs;

  @override
  void onInit() {
    currentProduct = (Get.arguments as ProductModel).obs;
    lstCurrentCart.value =
        userController.currentUser.value?.carts ?? <CartModel>[];
    isInCarts.value = checkInCurrentCart();
    userController.currentUser.listen((event) {
      if (event == null) return;
      lstCurrentCart.assignAll(event.carts);
      isInCarts.value = checkInCurrentCart();
    });
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedBack() => Get.back();

  Future<void> onPressedFavorite(int productId) async {
    final response = await userController.favoriteProduct(productId: productId);
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {});
  }

  bool checkInCurrentCart() => lstCurrentCart
      .any((element) => element.productModel.id == currentProduct.value.id);

  Future<void> addToCart() async {
    loading(true);
    final response = await userController.addProductToCard(
        productModel: currentProduct.value);
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {});
    loading(false);
  }

  Future<void> onPressedEditProduct() async {
    final response = await Get.toNamed(AppRouteProvider.adminEditProductScreen,
        arguments: currentProduct.value);
    if (response != null) {
      if (response is ProductModel) {
        currentProduct.value = response.copyWith();
        print('currentProduct: ${currentProduct.value.getPrice}');
      }
    }
  }
}
