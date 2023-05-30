part of global_controller;

final class NotificationController extends GetxController implements Bootable {
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

    notifications.listen(
        (_data) => notificationNews.assignAll(notifications.where((element) => element.isRead == false).toList()));
  }

  void _handleNotifications(String userId) async {
    _notificationSubscription = _databaseService.listenNotification(userId: userId).listen((event) async {
      final result = event.docs.map((e) => NotificationModel.fromJson(e.data())).toList();
      notifications.assignAll(result);
    });
  }

  Future<void> readNotification(NotificationModel notificationModel) async {
    if (!notificationModel.isRead) {
      notificationModel = notificationModel.changeIsRead(true);
      final _response = await _databaseService.updateNotification(notificationModel: notificationModel);
      _response.fold((l) => handleFailure(_logName, l), (r) async {});
    }

    if (notificationModel.type == NotificationType.chat) {
      if (notificationModel.groupChatId != null) {
        await _databaseService.getGroupChatByGroupChatId(groupChatId: notificationModel.groupChatId!).then((response) =>
            response.fold((l) => handleFailure(_logName, l),
                (r) => Get.toNamed(AppRouteProvider.chatDetailsScreen, arguments: r)));
      }
      return;
    }

    if (notificationModel.type == NotificationType.order) {
      // Role User
      final _order = await _databaseService
          .getOrderById(orderId: notificationModel.orderId)
          .then((_response) => _response.fold((l) => null, (r) => r));
      if (_order == null) return;

      if (_userController.currentUser.value?.isUser() ?? false) {
        final _currentOrder = DeliveryController.instance.currentOrder.value;
        if (_currentOrder != null &&
            _order.createdAt == _currentOrder.createdAt &&
            _currentOrder.status != HistoryStatus.done) {
          DeliveryController.instance.onChangeDeliveryStatus();
          Get.back();
          return;
        }
      }
      Get.toNamed(AppRouteProvider.orderDetailScreen, arguments: _order);
    }
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
                        text: notification.title, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
                  ),
                  AppText.labelMedium(text: notification.message, textAlign: TextAlign.center),
                  AppSizeScale(
                      ratioWidth: 0.8, child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 1)),
                  ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary, borderRadius: BorderRadius.circular(16.0)),
                        child: AppPadding.small(child: Icon(Icons.delete_outline))),
                    title: AppText.bodyMedium(text: 'Notification_Remove'.tr, textAlign: TextAlign.start),
                    onTap: () => Navigator.pop(context, true),
                  ),
                ],
              ),
            ));
    if (result == true) deleteNotification(notification);
  }

  Future<void> showBottomSheetSettings(BuildContext buildContext) async {
    final result = await showModalBottomSheet(
        context: buildContext,
        builder: (context) => AppPadding.medium(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary, borderRadius: BorderRadius.circular(16.0)),
                        child: AppPadding.small(child: Icon(Icons.mark_email_read_rounded))),
                    title: AppText.bodyMedium(text: 'Notification_Mark_All'.tr, textAlign: TextAlign.start),
                    onTap: () => Navigator.pop(context, 1),
                  ),
                  ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary, borderRadius: BorderRadius.circular(16.0)),
                        child: AppPadding.small(child: Icon(Icons.delete_outline))),
                    title: AppText.bodyMedium(text: 'Notification_Remove_All'.tr, textAlign: TextAlign.start),
                    onTap: () => Navigator.pop(context, 2),
                  ),
                ],
              ),
            ));
    if (result == 1) {
      readAllNotification(notifications.first);
    }

    if (result == 2) {
      deleteAllNotification(notifications.first);
    }
  }

  Future<void> readAllNotification(NotificationModel notificationModel) async => await _databaseService
      .readAllNotification(userId: notificationModel.receiverId)
      .then((_response) => _response.fold((l) => handleFailure(_logName, l), (r) => null));

  Future<void> deleteAllNotification(NotificationModel notificationModel) async => await _databaseService
      .deleteAllNotification(userId: notificationModel.receiverId)
      .then((_response) => _response.fold((l) => handleFailure(_logName, l), (r) => null));

  Future<void> deleteNotification(NotificationModel notificationModel) async => await _databaseService
      .deleteNotification(notificationModel: notificationModel)
      .then((_response) => _response.fold((l) => handleFailure(_logName, l), (r) => null));

  @override
  void dispose() => super.dispose();
}
