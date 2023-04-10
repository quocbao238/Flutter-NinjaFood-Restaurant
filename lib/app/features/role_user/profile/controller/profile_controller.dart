import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/globalController/userController.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'ProfileController';

class ProfileController extends BaseController {
  final DatabaseService databaseService = DatabaseService.instance;
  final UserController userController = UserController.instance;
  final lstProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    _getListFavoritesProduct();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _getListFavoritesProduct() async {
    loading.value = true;
    final lstFavoriteIds = userController.getCurrentUser?.favorites ?? [];
    if (lstFavoriteIds.isEmpty) return;
    final response = await databaseService.getListProductByListId(lstFavoriteIds);
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) => lstProducts.assignAll(r));
    loading.value = false;
  }
}
