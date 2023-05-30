part of global_controller;

final class CartController extends BaseController implements Bootable {
  static CartController get instance => Get.find<CartController>();
  final DatabaseService _databaseService = DatabaseService.instance;
  late final UserController _userController;

  //
  final lstCarts = <CartModel>[].obs;
  Rx<CardCartModel> cardCartModel = CardCartModel.empty().obs;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    cardCartModel.value.copyWith(
        serviceFee: _userController.currentUser.value?.serviceFee ?? 0.0);
    _listenCart();
  }

/* -------------------------------- Private Methods --------------------------------*/

  void _listenCart() {
    _userController.currentUser.listen((event) {
      if (event == null) return;
      lstCarts.assignAll(event.carts);
      _updateCardCartModel();
    });
  }

  void _updateCardCartModel() {
    double _calculatorServiceFee(double subTotal) {
      return (subTotal * cardCartModel.value.serviceFee) / 100;
    }

    double _subTotal = lstCarts.fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.quantity *
                (element.productModel.priceRange?.minimumPrice?.finalPrice
                        ?.value ??
                    0)));
    double _totalPrice = _subTotal + _calculatorServiceFee(_subTotal);

    cardCartModel.value = cardCartModel.value
        .copyWith(subTotalPrice: _subTotal, totalPrice: _totalPrice);
  }

/* -------------------------------- Public methods --------------------------------*/

  void increaseQuantity(CartModel cartModel, int index) {
    cartModel.increaseQuantity();
    lstCarts[index] = cartModel;
    _userController.updateUser(carts: lstCarts.toList());
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
    _userController.updateUser(carts: lstCarts.toList());
  }

  Future<void> onPressedRemoveItem(int index) async {
    loading.value = true;
    lstCarts.removeAt(index);
    await _userController.updateUser(carts: lstCarts.toList());
    loading.value = false;
  }

  Future<void> onSubmit() async {
    if (lstCarts.isEmpty) {
      Get.snackbar('Dialog_Error'.tr, 'Validate.Empty_Card'.tr);
      return;
    }
    // Show dialog if already have ordering...
    final currentOrder = DeliveryController.instance.currentOrder.value;
    if (currentOrder != null && currentOrder.status != HistoryStatus.done) {
      await DialogController.instance
          .showError(message: 'Cart_Already_Order'.tr);
      DeliveryController.instance.onChangeDeliveryStatus();
      return;
    }

    loading(true);
    final OrderModel orderModel = OrderModel(
        uid: Uuid().v4(),
        isRating: false,
        createdAt: createTimeStamp(),
        subTotal: cardCartModel.value.subTotalPrice,
        serviceFee: cardCartModel.value.serviceFee,
        userId: _userController.currentUser.value?.uid ?? '',
        total: cardCartModel.value.totalPrice,
        discount: cardCartModel.value.promotion,
        carts: lstCarts.toList(),
        status: HistoryStatus.request);
    await Future.delayed(Duration(seconds: 1));
    loading(false);
    Future.delayed(Duration(seconds: 1)).then((value) async {
      await _databaseService.insertOrder(orderModel: orderModel).then(
          (response) => response.fold(
                  (l) => handleFailure('Cart Screen Controller', l,
                      showDialog: true), (r) async {
                final orderIds =
                    _userController.currentUser.value?.orderIds ?? [];
                _userController.updateUser(
                    carts: [], orderIds: [...orderIds, orderModel.uid]);
                _userController
                    .sendDeliveryNotificationToRestaurant(orderModel);
              }));
      loading(false);
    });
  }

  bool checkProductInCart(int productId) =>
      lstCarts.any((element) => element.productModel.id == productId);

  void onSubmitDone() => TabsController.instance.onChangeToHomeScreen();
}
