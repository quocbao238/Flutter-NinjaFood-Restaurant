part of global_controller;

final class FavoriteController extends BaseController implements Bootable {
  static FavoriteController get instance => Get.find<FavoriteController>();
  late final UserController _userController;
  final DatabaseService _databaseService = DatabaseService.instance;

  RxList<ProductModel> lstFavoriteProduct = <ProductModel>[].obs;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    _listenCart();
  }

/* -------------------------------- Private Methods --------------------------------*/

  bool checkProductIsFavorite(int productId) =>
      lstFavoriteProduct.any((element) => element.id == productId);

  void _listenCart() => _userController.currentUser.listen((event) {
        if (event == null) return;
        _getListFavoritesProduct(event.favoriteIds);
      });

  void _getListFavoritesProduct(List<int> lstFavoriteProductId) async {
    await _databaseService.getListProductByListId(lstFavoriteProductId).then(
        (response) => response.fold(
                (l) => handleFailure(_logName, l, showDialog: false), (r) {
              if (r.isEmpty) return;
              if (r.length == lstFavoriteProduct.length) return;
              lstFavoriteProduct.assignAll(r);

            }));
  }

/* -------------------------------- Public methods --------------------------------*/

  // Public methods
  void setFavoriteProduct(int? productId) {
    if (productId == null) return;
    final lstFavoriteProductId =
        _userController.currentUser.value?.favoriteIds ?? [];
    if (lstFavoriteProductId.contains(productId)) {
      lstFavoriteProductId.remove(productId);
    } else {
      lstFavoriteProductId.add(productId);
    }
    _userController.updateUser(favoriteIds: [...lstFavoriteProductId]);
  }

  void onPressedItem(ProductModel productModel) =>
      Get.toNamed(AppRouteProvider.foodDetailScreen, arguments: productModel);
}
