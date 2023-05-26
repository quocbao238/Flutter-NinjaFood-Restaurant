part of global_controller;

final class HistoryController extends BaseController implements Bootable {
  static HistoryController get instance => Get.find<HistoryController>();
  late final UserController _userController;
  final DatabaseService _databaseService = DatabaseService.instance;
  final lstHistory = <OrderModel>[].obs;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    _listenHistory();
  }

  void _listenHistory() => _userController.currentUser.listen((event) {
        if (event == null) return;
        _getListOrderHistory(event.orderIds);
      });

  Future<void> _getListOrderHistory(List<String> ordersId) async {
    if (ordersId.isEmpty) {
      return;
    }
    loading(true);
    final response = await _databaseService.getListOrdersByListId(ordersId);
    response.fold(
        (l) => handleFailure(_logName, l, showDialog: true),
        (r) => lstHistory.assignAll(r
            .where((element) => element.status == HistoryStatus.done)
            .toList()));
  }
}
