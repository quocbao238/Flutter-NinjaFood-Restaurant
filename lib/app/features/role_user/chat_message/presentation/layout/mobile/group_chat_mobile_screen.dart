import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/group_chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'widgets/group_chat/group_chat_list.dart';

class GroupChatMobileScreen extends GetView<GroupChatScreenController> {
  const GroupChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.pattern(
        floatActionButton: FloatingActionButton(
          heroTag: null,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () => controller.handleOnTapChat(),
          child: Icon(Icons.message, color: Colors.white),
        ),
        appBarWidget:
            AppButtonDrawer(onPressed: () => tabController.toggleDrawer()),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                  child: AppText.headlineSmall(text: 'Chat', fontWeight: FontWeight.bold)),
              Obx(() => GroupChatList(groupChats: controller.groupChats.value, onTap: controller.onTapChat))
            ],
          ),
        ));
  }
}
