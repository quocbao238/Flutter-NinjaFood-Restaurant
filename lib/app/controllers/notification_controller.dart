part of global_controller;

class NotificationController extends GetxController implements Bootable {
  static NotificationController get instance => Get.find<NotificationController>();
  late final DatabaseService _databaseService;
  late final UserController _userController;

  final notifications = <NotificationModel>[].obs;
  final notificationNews = <NotificationModel>[].obs;
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

    notifications.listen((_data) {
      notificationNews.assignAll(notifications.where((element) => element.isRead == false).toList());
    });
  }

  void _handleNotifications(String userId) async {
    _notificationSubscription = _databaseService.listenNotification(userId: userId).listen((event) async {
      final result = event.docs.map((e) {
        final _data = e.data();
        return NotificationModel.fromJson(_data);
      }).toList();
      notifications.assignAll(result);
    });
  }

  Future<void> readNotification(NotificationModel notificationModel) async {
    // GoTo Page
    if (notificationModel.type == NotificationType.order) {
      DeliveryController.instance.onChangeDeliveryStatus();
    }
    notificationModel = notificationModel.changeIsRead(true);
    final _response = await _databaseService.updateNotification(notificationModel: notificationModel);
    _response.fold((l) => handleFailure(_logName, l), (r) => null);
  }

  Future<void> showBottomSheet(NotificationModel notification, BuildContext buildContext) async {
    final result = await showModalBottomSheet(
        context: buildContext,
        builder: (context) => AppPadding.medium(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppNetworkImage(
                      borderRadius: 16,
                      width: MediaQuery.of(context).size.shortestSide * 0.2,
                      height: MediaQuery.of(context).size.shortestSide * 0.2,
                      fit: BoxFit.fill,
                      url: notification.image),
                  AppPadding.small(
                    child: AppText.bodyMedium(
                      text: notification.title,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppText.labelMedium(
                    text: notification.message,
                    textAlign: TextAlign.center,
                  ),
                  AppSizeScale(
                      ratioWidth: 0.8, child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 1)),
                  ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: AppPadding.small(child: Icon(Icons.delete_outline))),
                    title: AppText.bodyMedium(
                      text: 'Xóa thông báo này',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () => Navigator.pop(context, true),
                  ),
                ],
              ),
            ));
    if (result == true) deleteNotification(notification);
  }

  Future<void> deleteNotification(NotificationModel notificationModel) async {
    final _response = await _databaseService.deleteNotification(notificationModel: notificationModel);
    _response.fold((l) => handleFailure(_logName, l), (r) => null);
  }

  @override
  void dispose() => super.dispose();
}
