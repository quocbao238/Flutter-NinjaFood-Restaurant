import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/cart/models/order_detail_model.dart';

class CartScreenController extends BaseController {
  final lstOrderDetails = <OrderDtails>[].obs;

  @override
  void onInit() {
    lstOrderDetails.assignAll(OrderDtails.orderDtails);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void add(OrderDtails orderDetails, int index) {
    int _currentCount = lstOrderDetails[index].count;
    int _increase = _currentCount + 1;
    lstOrderDetails[index].count = _increase;
    print(lstOrderDetails[index].count);
    lstOrderDetails.refresh();
  }

  void remove(OrderDtails orderDetails, int index) {
    int _currentCount = lstOrderDetails[index].count;
    int _decrease = _currentCount - 1;
    lstOrderDetails[index].count = _decrease;
    print(lstOrderDetails[index].count);
    lstOrderDetails.refresh();
  }
}
