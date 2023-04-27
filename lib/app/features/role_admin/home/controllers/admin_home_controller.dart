import 'package:get/get.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/history_model.dart';

class AdminHomeController extends BaseController {
  final deliveryController = DeliveryController.instance;
  final _orderModels = <OrderModel>[].obs;
  final ordersFilter = <OrderModel>[].obs;
  final currentHistoryStatus = HistoryStatus.pending.obs;

  @override
  void onInit() {
    _orderModels.value = deliveryController.lstOrderModel.toList();
    filterOrderByHistoryStatus(currentHistoryStatus.value);
    deliveryController.lstOrderModel.listen((value) {
      _orderModels.value = value;
      filterOrderByHistoryStatus(currentHistoryStatus.value);
    });
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void filterOrderByHistoryStatus(HistoryStatus status) {
    currentHistoryStatus.value = status;
    ordersFilter.value = _orderModels.toList();
    // ordersFilter.value =
    //     _orderModels.where((item) => item.status == status).toList();
  }
}
