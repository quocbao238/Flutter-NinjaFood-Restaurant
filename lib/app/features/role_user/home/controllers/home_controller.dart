import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/home/infrastructure/models/popular_food_model.dart';
import 'package:ninjafood/app/features/role_user/home/infrastructure/models/popular_menu_model.dart';
import 'package:ninjafood/app/features/role_user/tabs/infrastructure/models/menu_models.dart';
import 'package:ninjafood/app/global_controller/db_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'HomeController';

enum HomeViewType { normal, popularMenu, popularFood }

class HomeController extends BaseController {
  final AuthController authController;
  final DatabaseController databaseController;

  HomeController(
      {required this.authController, required this.databaseController});

  final menus = <CategoryModel>[].obs;
  final product = <ProductModel>[].obs;
  final promotions = <PromotionModel>[].obs;

  Rx<HomeViewType> homeViewType = HomeViewType.normal.obs;
  final currentIndexPromotion = 0.obs;

  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }



  Future<void> fetchAllData() async {
    loading.value = true;
    await _fetchProduct();
    await _fetchMenus();
    await _fetchPromotions();
    loading.value = false;
  }

  Future<void> _fetchMenus() async {
    final response = await databaseController.getListCategories();
    response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (List<CategoryModel> r) {
      // r.sort((a, b) =>
      //     (a.productIds?.length ?? 0) < (b.productIds?.length ?? 0) ? 1 : -1);
      return menus.value = r;
    });
  }

  Future<void> _fetchProduct() async {
    final response = await databaseController.getListProducts();
    response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (List<ProductModel> r) => product.value = r);
  }

  Future<void> _fetchPromotions() async {
    final response = await databaseController.getListPromotion();
    response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (r) => promotions.value = r);
  }

  String getImageUrlByProductId(int id) {
    return product.firstWhere((element) => id == element.id).image?.url ?? '';
  }

  List<ProductModel> filterProductByIds(List<int> ids) {
    return product.where((element) => ids.contains(element.id)).toList();
  }

  void onPressedLogout() async {
    final response = await authController.signOut();
    response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (r) => Get.offAllNamed(AppRouteProvider.signinScreen));
  }



  void onPressedVerifyEmail() async {
    final response = await authController.sendEmailVerification();
    response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (r) => Get.snackbar('Success', 'Email verification sent'));
  }

  void onPressedViewMorePopularMenu() {
    homeViewType.value = HomeViewType.popularMenu;
  }

  void onPressedViewMorePopularFood() {
    homeViewType.value = HomeViewType.popularFood;
  }

  void onPressedBackToNormalHome(){
    homeViewType.value = HomeViewType.normal;
  }
}
