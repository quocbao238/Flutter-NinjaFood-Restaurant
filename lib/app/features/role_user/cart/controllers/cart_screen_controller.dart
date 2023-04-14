import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';
import 'package:uuid/uuid.dart';

class CartScreenController extends BaseController {
  final UserController userController = UserController.instance;
  final DatabaseService databaseService = DatabaseService.instance;
  final lstCarts = <CartModel>[].obs;
  Rx<double> subTotalPrice = 0.0.obs;
  Rx<double> totalPrice = 0.0.obs;
  Rx<double> promotion = 0.0.obs;
  double serviceFee = 0.0;

  @override
  void onInit() {
    userController.currentUser.listen((event) {
      if (event == null) return;
      serviceFee = userController.getCurrentUser?.serviceFee ?? 0.0;
      lstCarts.assignAll(event.carts);
      subTotalPrice.value = _getSubTotalPrice();
      totalPrice.value = _getTotalPrice();
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increaseQuantity(CartModel cartModel, int index) {
    cartModel.increaseQuantity();
    lstCarts[index] = cartModel;
    userController.updateUser(carts: lstCarts.toList());
  }

  void decreaseQuantity(CartModel cartModel, int index) {
    cartModel.decreaseQuantity();
    lstCarts[index] = cartModel;
    if (cartModel.quantity == 0) {
      lstCarts.removeAt(index);
    }
    userController.updateUser(carts: lstCarts.toList());
  }

  double _getSubTotalPrice() {
    return lstCarts.fold(
        0,
            (previousValue, element) =>
        previousValue +
            (element.quantity * (element.productModel.priceRange?.minimumPrice?.finalPrice?.value ?? 0)));
  }

  double _calculatorServiceFee(double subTotal) {
    return (subTotal * serviceFee) / 100;
  }

  double _getTotalPrice() {
    return _getSubTotalPrice() + _calculatorServiceFee(_getSubTotalPrice());
  }

  Future<void> onPressedPlaceMyOrder() async {
    final HistoryOrderModel historyOrderModel = HistoryOrderModel(
        uid: Uuid().v4(),
        createdAt: createTimeStamp(),
        subTotal: subTotalPrice.value,
        serviceFee: serviceFee,
        total: totalPrice.value,
        discount: promotion.value,
        carts: lstCarts.toList(),
        status: HistoryStatus.pending);
    final List<HistoryOrderModel> lstHistory = userController.getCurrentUser?.historyOrders ?? [];
    lstHistory.add(historyOrderModel);
    loading(true);
    final response = await userController.updateUser(historyOrders: lstHistory);
    response.fold((l) => handleFailure('Cart Screen Controller', l, showDialog: true), (r) {
      Get.snackbar('Success', 'Place my order successfully');
      userController.updateUser(carts: []);
    });
    loading(false);

  }
}
