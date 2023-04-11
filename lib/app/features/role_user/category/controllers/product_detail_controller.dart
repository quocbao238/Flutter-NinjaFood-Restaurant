import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/models/product_model.dart';

const _logName = 'ProductDetailController';

class ProductDetailController extends BaseController {
  final ProductModel currentProduct = Get.arguments;
  final UserController userController = UserController.instance;

  @override
  void onInit() {
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
}
