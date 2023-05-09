import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_user/notification/presentation/layout/mobile/widgets/box_notification.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class NotificationMobileView extends GetView<NotificationController> {
  const NotificationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final roleUser =
        UserController.instance.currentUser.value?.isUser() ?? false;

    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: roleUser
          ? CustomAppBar.back(
              title: 'Notification_Title'.tr,
            )
          : CustomAppBar.drawer(
              title: 'Notification_Title'.tr,
            ),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Obx(() {
          final notifications = controller.notifications;

          if (notifications.isEmpty)
            return Center(child: Text('No notification'));

          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return BoxNotification(
                    child: AppNetworkImage(
                        borderRadius: 16,
                        width: MediaQuery.of(context).size.shortestSide * 0.15,
                        height: MediaQuery.of(context).size.shortestSide * 0.15,
                        fit: BoxFit.fill,
                        url: notification.image),
                    onPressedItem: () =>
                        controller.readNotification(notification),
                    onPressedMore: () =>
                        controller.showBottomSheet(notification, context),
                    title: notification.title,
                    isRead: notification.isRead,
                    message: notification.message,
                    time: convertTimeStamp(notification.createAt));
              });
        }),
      ),
    );
  }
}
