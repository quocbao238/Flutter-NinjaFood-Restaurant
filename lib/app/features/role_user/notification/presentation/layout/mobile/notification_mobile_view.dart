import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/notification/presentation/layout/mobile/widgets/box_notification.dart';

class NotificationMobileView extends GetView {
  const NotificationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: AppButtonBack(
          onPressed: () => Get.back(),
        ),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.headlineMedium(
                text: 'Notification',
                fontWeight: FontWeight.bold,
              ),
              //** 
              // Add icon Notification
              // */
              BoxNotification(
                child: AppIcons.camera(),
                notice: 'Your order has been taken by the driver',
                time: 'Recently',
              ),
              BoxNotification(
                child: AppIcons.edit(color: Colors.black,),
                notice: 'Topup for \$100 was successful',
                time: '10.00 Am',
              ),
              BoxNotification(
                child: AppIcons.checkbox(),
                notice: 'Your order has been canceled',
                time: '22 Juny 2021',
              ),
            ],
          ),
        ));
  }
}

