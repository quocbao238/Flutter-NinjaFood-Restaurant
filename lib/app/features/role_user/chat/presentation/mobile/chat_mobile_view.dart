import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat/controllers/chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/chat/presentation/mobile/widgets/chat_list.dart';

class MobileChatScreen extends GetView<ChatScreenController> {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        floatActionButton: FloatingActionButton(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          onPressed: () => controller.handleOnTapChat(),
          child: Icon(Icons.message, color: Colors.white),
        ),
        appBarWidget: AppButtonDrawer(onPressed: () => controller.tabsController.toggleDrawer()),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                  padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                  child: AppText.headlineSmall(text: 'Chat', fontWeight: FontWeight.bold)),

              Obx(() {
                final chatList = controller.chatList.value;
                return ChatList(
                  listChat: chatList,
                  onTap: controller.onTapChat,
                );
              }),

              // ChatDetails()
            ],
          ),
        ));
  }
}
