import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat/controllers/chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/chat/presentation/mobile/widgets/chat_list.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/globalController/userController.dart';

class MobileChatScreen extends GetView<ChatScreenController> {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.pattern(
        floatActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () => controller.handleOnTapChat(),
          child: Icon(Icons.message, color: Colors.white),
        ),
        appBarWidget: AppButtonDrawer(onPressed: () => tabController.toggleDrawer()),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                  child: AppText.headlineSmall(text: 'Chat', fontWeight: FontWeight.bold)),

              Obx(() {
                final groupChats = controller.groupChats.value;
                return ChatList(
                  groupChats: groupChats,
                  onTap: controller.onTapChat,
                );
              }),

              // ChatDetails()
            ],
          ),
        ));
  }
}
