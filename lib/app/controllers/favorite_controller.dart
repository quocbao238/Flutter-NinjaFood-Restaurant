part of global_controller;

final class FavoriteController extends BaseController implements Bootable {
  static FavoriteController get instance => Get.find<FavoriteController>();
  late final UserController _userController;
  final DatabaseService _databaseService = DatabaseService.instance;

  final lstFavoriteProductId = <int>[].obs;
  final lstFavoriteProduct = <ProductModel>[].obs;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    _listenCart();
  }

/* -------------------------------- Private Methods --------------------------------*/

  void _listenCart() {
    _userController.currentUser.listen((event) {
      if (event == null) return;
      lstFavoriteProductId.assignAll(event.favoriteIds);
      _getListFavoritesProduct();
    });
  }

  void _getListFavoritesProduct() async {
    loading.value = true;
    final lstFavoriteIds = _userController.currentUser.value?.favoriteIds ?? [];
    if (lstFavoriteIds.isEmpty) {
      loading.value = false;
      return;
    }
    final response =
        await _databaseService.getListProductByListId(lstFavoriteIds);
    response.fold((l) => handleFailure(_logName, l, showDialog: false), (r) {
      if (r.length != lstFavoriteProduct.length) {
        lstFavoriteProduct.assignAll(r);
      }
    });
    loading.value = false;
  }


/* -------------------------------- Public methods --------------------------------*/

  bool checkProductIsFavorite(int? productId) {
    if (productId == null) return false;
    return lstFavoriteProductId.contains(productId) ? true : false;
  }

  // Public methods
  void setFavoriteProduct(int? productId) {
    if (productId == null) return;
    if (lstFavoriteProductId.contains(productId)) {
      lstFavoriteProductId.remove(productId);
    } else {
      lstFavoriteProductId.add(productId);
    }
    _userController.updateUser(favoriteIds: lstFavoriteProductId);
  }

  void onPressedItem(ProductModel productModel) => Get.toNamed(AppRouteProvider.foodDetailScreen, arguments: productModel);
}
