import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'HomeController';

enum HomeViewType { normal, popularMenu, popularFood }

class HomeController extends BaseController {


  final menus = <CategoryModel>[].obs;
  final products = <ProductModel>[].obs;
  final promotions = <PromotionModel>[].obs;

  Rx<HomeViewType> homeViewType = HomeViewType.normal.obs;
  final currentIndexPromotion = 0.obs;
  late final searchController;
  final showClearSearch = false.obs;
  String lastSearch = "";

  @override
  void onInit() {
    searchController = TextEditingController();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        showClearSearch.value = false;
      } else {
        showClearSearch.value = true;
      }
    });
    fetchAllData();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchAllData() async {
    loading.value = true;
    await _fetchProduct();
    await _fetchMenus();
    await _fetchPromotions();
    loading.value = false;
  }

  Future<void> _fetchMenus() async {
    // final response = await databaseController.getListCategories();
    // response.fold((l) => handleFailure(_logName, l, showDialog: true),
    //     (List<CategoryModel> r) {
    //   r.sort((a, b) => a.name!.compareTo(b.name!));
    //   return menus.value = r;
    // });
  }

  Future<void> _fetchProduct() async {
    // final response = await databaseController.getListProducts();
    // response.fold((l) => handleFailure(_logName, l, showDialog: true),
    //     (List<ProductModel> r) {
    //   r.sort((a, b) => a.name!.compareTo(b.name!));
    //   return products.value = r;
    // });
  }

  Future<void> _fetchPromotions() async {
    // final response = await databaseController.getListPromotion();
    // response.fold((l) => handleFailure(_logName, l, showDialog: true),
    //     (r) => promotions.value = r);
  }

  String getImageUrlByProductId(int id) {
    return products.firstWhere((element) => id == element.id).image?.url ?? '';
  }

  List<ProductModel> filterProductByIds(List<int> ids) {
    return products.where((element) => ids.contains(element.id)).toList();
  }

  Future<List<ProductModel>> searchFood(String pattern) async {
    List<ProductModel> tempList = [];
    if (pattern.length > 0 && lastSearch != pattern) {
      String _searchData = Common.sanitizing(pattern);
      for (int index = 0; index < products.length; index++) {
        bool compareProduct = Common.sanitizing(products[index].name ?? '')
            .toString()
            .contains(_searchData);
        if (compareProduct) tempList.add(products[index]);
      }
      lastSearch = pattern;
    } else {
      tempList.assignAll(products);
    }
    return tempList;
  }

  void onSuggestionSelected(ProductModel product) {
    lastSearch = product.name ?? '';
    // Get.toNamed(AppRouteProvider.searchScreen, arguments: suggestion);
  }

  void onPressedLogout() async {
    // final response = await authController.signOut();
    // response.fold((l) => handleFailure(_logName, l, showDialog: true),
    //     (r) => Get.offAllNamed(AppRouteProvider.signinScreen));
  }

  void onPressedVerifyEmail() async {
    // final response = await authController.sendEmailVerification();
    // response.fold((l) => handleFailure(_logName, l, showDialog: true),
    //     (r) => Get.snackbar('Success', 'Email verification sent'));
  }

  void onPressedViewMorePopularMenu() {
    homeViewType.value = HomeViewType.popularMenu;
  }

  void onPressedViewMorePopularFood() {
    homeViewType.value = HomeViewType.popularFood;
  }

  void onPressedBackToNormalHome() {
    homeViewType.value = HomeViewType.normal;
  }

  void onPressedMenuItem(CategoryModel category) {
    Get.toNamed(AppRouteProvider.menuScreen, arguments: category);
  }

  void onPressedFoodItem(ProductModel product) {
    // Get.toNamed(AppRouteProvider.foodDetailScreen, arguments: product);
  }

  void onPressedClearSearch() {
    searchController.clear();
    showClearSearch.value = false;
  }
}
