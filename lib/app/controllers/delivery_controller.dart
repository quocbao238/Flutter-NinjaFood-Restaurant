import 'dart:async';

import 'package:get/get.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class DeliveryController extends GetxController implements Bootable {
  static DeliveryController get instance => Get.find<DeliveryController>();
  StreamSubscription? _orderSubscription;
  late final UserController _userController;
  late final DatabaseService _databaseService;
  final currentOrder = Rx<OrderModel?>(null);
  final lstOrderModel = RxList<OrderModel>([]);
  final disableShowDelivery = Rx<bool>(false);

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    _databaseService = DatabaseService.instance;
    _userController.currentUser.listen((user) {
      if (user == null) {
        _orderSubscription?.cancel();
        currentOrder.value = null;
        lstOrderModel.clear();
        disableShowDelivery.value = false;
      }
      if (user != null) {
        _handleDelivery(user.uid);
      }
    });
  }

  void _handleDelivery(String userUid) async {
    if (_userController.currentUser.value?.isAdmin() ?? false) {
      _orderSubscription = _databaseService.listenOrders().listen((event) {
        lstOrderModel.value =
            event.docs.map((e) => OrderModel.fromJson(e.data())).toList();
        print(lstOrderModel);
      });
      return;
    }

    _orderSubscription =
        _databaseService.listenCurrentOrder(userUid).listen((event) {
      if (event.docs.isEmpty || event.docs.last.data().isEmpty) return;
      final _order = OrderModel.fromJson(event.docs.first.data());
      if (_order.status != currentOrder.value?.status) {
        disableShowDelivery.value = false;
      }
      currentOrder.value = _order;
    });
  }

  void onChangeDeliveryStatus() =>
      disableShowDelivery.value = !disableShowDelivery.value;

  @override
  void dispose() {
    _orderSubscription?.cancel();
    super.dispose();
  }
}
