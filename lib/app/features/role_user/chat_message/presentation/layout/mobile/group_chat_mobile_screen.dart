import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/group_chat_screen_controller.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';
import 'widgets/group_chat/group_chat_list.dart';

class GroupChatMobileScreen extends GetView<GroupChatScreenController> {
  const GroupChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        floatActionButton: Obx(() {
          return controller.groupChats.isNotEmpty
              ? SizedBox.shrink()
              : FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => controller.handleOnTapChat(),
                  child: Icon(Icons.message, color: Colors.white),
                );
        }),
        appBarWidget: CustomAppBar.drawer(title: 'Drawer_Chat'.tr),
        body: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => GroupChatList(
                  groupChats: controller.groupChats.toList(),
                  onTap: controller.onTapChat))
            ],
          ),
        ));
  }
}
