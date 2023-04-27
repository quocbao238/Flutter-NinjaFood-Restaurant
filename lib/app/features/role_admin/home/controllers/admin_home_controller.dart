import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'AdminHomeController';

class AdminHomeController extends BaseController {
  final deliveryController = DeliveryController.instance;
  final DatabaseService databaseService = DatabaseService.instance;
  final orderModels = <OrderModel>[].obs;
  final ordersFilter = <OrderModel>[].obs;

  //Null safety
  final currentHistoryStatus = Rx<HistoryStatus>(HistoryStatus.all);

  final List<HistoryStatus> lstHistoryStatus = [
    HistoryStatus.pending,
    HistoryStatus.delivering,
    HistoryStatus.delivered,
    HistoryStatus.cancelled,
  ];

  final List<HistoryStatus> filterHistoryStatus = [
    HistoryStatus.pending,
    HistoryStatus.delivering,
    HistoryStatus.delivered,
    HistoryStatus.cancelled,
    HistoryStatus.all
  ];

  @override
  void onInit() {
    orderModels.value = deliveryController.lstOrderModel.toList();
    filterOrderByHistoryStatus(currentHistoryStatus.value);
    deliveryController.lstOrderModel.listen((value) {
      orderModels.value = value;
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
    if (status == HistoryStatus.all) {
      ordersFilter.value = orderModels.toList();
      return;
    }
    ordersFilter.value = orderModels.where((item) => item.status == status).toList();
  }

  String calculateTotalPriceToday() {
    final total = orderModels.toList().fold<double>(0, (previousValue, element) => previousValue + element.total);
    return formatPriceToVND(total);
  }

  Future<void> updateStatusOrder({required OrderModel orderModel, required HistoryStatus status}) async {
    orderModel.status = status;
    loading.value = true;
    final response = await databaseService.updateOrder(orderModel: orderModel);
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {});
    loading.value = false;
  }

  List<HistoryStatus> getListStatus({required OrderModel orderModel}) {
    final List<HistoryStatus> listStatus = lstHistoryStatus.where((element) => element != orderModel.status).toList();
    return listStatus.where((element) => element.index > orderModel.status.index).toList();
  }
}
