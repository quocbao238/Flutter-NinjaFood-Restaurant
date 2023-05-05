part of global_controller;


class NotificationController extends GetxController implements Bootable {
  static NotificationController get instance => Get.find<NotificationController>();
  late final DatabaseService _databaseService;
  late final UserController _userController;

  final notifications = <NotificationModel>[].obs;
  StreamSubscription? _notificationSubscription;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _databaseService = DatabaseService.instance;
    _userController = UserController.instance;
    _userController.currentUser.listen((user) {
      if (user == null) {
        _notificationSubscription?.cancel();
        notifications.clear();
        return;
      }
      _handleNotifications(user.uid);
    });
  }

  void _handleNotifications(String userId) async {
    _notificationSubscription = _databaseService.listenNotification(userId: userId).listen((event) async {
      final result = event.docs.map((e) => NotificationModel.fromJson(e.data())).toList();
      notifications.assignAll(result);
    });
  }

  Future<void> readNotification(NotificationModel notificationModel) async {
    notificationModel.changeIsRead(true);
    final _response = await _databaseService.updateNotification(notificationModel: notificationModel);
    _response.fold((l) => handleFailure(_logName, l), (r) => null);
  }

  @override
  void dispose() => super.dispose();
}
