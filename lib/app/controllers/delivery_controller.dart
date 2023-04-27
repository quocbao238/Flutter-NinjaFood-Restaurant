import 'dart:async';

import 'package:get/get.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class DeliveryController extends GetxController implements Bootable {
  StreamSubscription? _orderSubscription;
  late final UserController userController;
  late final DatabaseService _databaseService;

  final currentOrder = Rx<OrderModel?>(null);

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    userController = UserController.instance;
    _databaseService = DatabaseService.instance;
    userController.currentUser.listen((user) {
      if (user == null) {
        _orderSubscription?.cancel();
      }
      if (user != null) {
        _handleDelivery(user.uid);
      }
    });
  }

  void _handleDelivery(String userUid) async {
    _orderSubscription = _databaseService
        .listenCurrentOrder(userUid)
        .listen((event) {
      if (event.docs.isEmpty || event.docs.last.data().isEmpty) return;
      final _order = OrderModel.fromJson(event.docs.first.data());
      currentOrder.value = _order;
    });
  }

  @override
  void dispose() {
    _orderSubscription?.cancel();
    super.dispose();
  }
}
