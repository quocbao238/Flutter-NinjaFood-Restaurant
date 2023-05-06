import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';
import 'package:uuid/uuid.dart';

class CartScreenController extends BaseController {
  final UserController userController = UserController.instance;
  final TabsController tabsController = TabsController.instance;
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
      serviceFee = userController.currentUser.value?.serviceFee ?? 0.0;
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

  Future<void> decreaseQuantity(CartModel cartModel, int index) async {
    bool nextStep = true;
    if (cartModel.quantity == 1) {
      await DialogController.instance.showCustomizedDialog(
          message: 'Cart_Remove_Item_Message'.tr,
          leftBtnOnPressed: () {
            Get.back();
            nextStep = false;
          },
          rightBtnText: 'Cart_Remove_Item'.tr,
          leftBtnText: 'Dialog_Cancel'.tr,
          rightBtnOnPressed: () => {});
      if (!nextStep) return;
    }
    cartModel.decreaseQuantity();
    lstCarts[index] = cartModel;
    if (cartModel.quantity == 0) {
      lstCarts.removeAt(index);
    }
    userController.updateUser(carts: lstCarts.toList());
  }

  Future<void> onPressedRemoveItem(int index) async {
    loading.value = true;
    lstCarts.removeAt(index);
    await userController.updateUser(carts: lstCarts.toList());
    loading.value = false;
  }

  double _getSubTotalPrice() {
    return lstCarts.fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.quantity *
                (element.productModel.priceRange?.minimumPrice?.finalPrice
                        ?.value ??
                    0)));
  }

  double _calculatorServiceFee(double subTotal) {
    return (subTotal * serviceFee) / 100;
  }

  double _getTotalPrice() {
    return _getSubTotalPrice() + _calculatorServiceFee(_getSubTotalPrice());
  }

  void onPressedDone() {
    tabsController.onChangeToHomeScreen();
  }

  Future<void> onPressedPlaceMyOrder() async {
    //

    if (lstCarts.isEmpty) {
      Get.snackbar('Error', 'Your cart is empty');
      return;
    }

    // Show dialog if already have odering...
    if (loading.value) {
      await DialogController.instance
          .showError(message: 'You already have ordering');
      DeliveryController.instance.onChangeDeliveryStatus();
      return;
    }

    loading(true);

    final OrderModel orderModel = OrderModel(
        uid: Uuid().v4(),
        isRating: false,
        createdAt: createTimeStamp(),
        subTotal: subTotalPrice.value,
        serviceFee: serviceFee,
        userId: userController.currentUser.value?.uid ?? '',
        total: totalPrice.value,
        discount: promotion.value,
        carts: lstCarts.toList(),
        status: HistoryStatus.request);
    await Future.delayed(Duration(seconds: 1));
    loading(false);

    Future.delayed(Duration(seconds: 3)).then((value) async {
      final response =
          await databaseService.insertOrder(orderModel: orderModel);
      response.fold(
          (l) => handleFailure('Cart Screen Controller', l, showDialog: true),
          (r) async {
        final orderIds = userController.currentUser.value?.orderIds ?? [];
        userController
            .updateUser(carts: [], orderIds: [...orderIds, orderModel.uid]);
        await userController.sendDeliveryNotificationToRestaurant(orderModel);
      });
      loading(false);
    });
  }
}
