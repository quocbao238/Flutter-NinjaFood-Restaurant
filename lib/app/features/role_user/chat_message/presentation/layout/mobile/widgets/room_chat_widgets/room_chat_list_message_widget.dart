import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';

import '../message/message_item_widget.dart';

class RoomChatListMessageWidget extends GetView<RoomChatScreenController> {
  const RoomChatListMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppPadding(
        padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
        child: Obx(() {
          final messageChats = controller.lstChatMessage.value;
          return ListView.builder(
              controller: controller.scrollController,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: messageChats.length,
              itemBuilder: (context, index) {
                final messageItem = messageChats[index];
                final isCurrentUser = messageItem.senderId == controller.senderUser.uid;
                return MessageItemWidget(avatarUrl: null, messageChat: messageItem, isCurrentUser: isCurrentUser);
              });
        }),
      ),
    );
  }
}
