import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/product_model.dart';

class ProductDetailController extends BaseController {

  final ProductModel currentProduct = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedBack() {
    Get.back();
  }
}
