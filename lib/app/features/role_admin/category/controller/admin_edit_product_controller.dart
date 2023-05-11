import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class AdminEditProductScreenController extends BaseController {

  final DatabaseService _databaseService = DatabaseService.instance;

  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productDescriptionController;

  Rxn<String?> productNameError = Rxn<String?>(null);
  Rxn<String?> productPriceError = Rxn<String?>(null);
  Rxn<String?> productDescriptionError = Rxn<String?>(null);

  String? productImage;

  final newPrice = Rx<String>('');

  late ProductModel productModel;

  @override
  void onInit() {
    productModel = Get.arguments as ProductModel;
    newPrice.value = (productModel.priceRange?.minimumPrice?.finalPrice?.value ?? 0).toString();
    final description = productModel.description?.content ?? demoDetailProduct;
    productNameController = TextEditingController(text: productModel.name);
    productPriceController = TextEditingController(text: newPrice.value);
    productDescriptionController = TextEditingController(text: description);
    productImage = productModel.image?.url;

    productNameController.addListener(() {
      if (productNameController.text.isEmpty) {
        productNameError.value = 'Tên không được để trống'.tr;
      } else {
        productNameError.value = null;
      }
    });

    productPriceController.addListener(() {
      newPrice.value = productPriceController.text;
      if (productPriceController.text.isEmpty) {
        productPriceError.value = 'Giá không được để trống'.tr;
      } else {
        productPriceError.value = null;
      }
    });

    productDescriptionController.addListener(() {
      if (productDescriptionController.text.isEmpty) {
        productDescriptionError.value = 'Chi tiết không được để trống'.tr;
      } else {
        productDescriptionError.value = null;
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productPriceController.dispose();
    productDescriptionController.dispose();
  }

  onPressedUpdate() async {
    if (productDescriptionError.value != null || productPriceError.value != null || productNameError.value != null) {
      return;
    }
    final updateProduct = productModel;
    updateProduct.setName(productNameController.text);
    updateProduct.setPrice(newPrice.value);
    updateProduct.setDescription(productDescriptionController.text);

    loading(true);
    final response = _databaseService.
    updateProduct
      (
        productModel
    )
  }
}
