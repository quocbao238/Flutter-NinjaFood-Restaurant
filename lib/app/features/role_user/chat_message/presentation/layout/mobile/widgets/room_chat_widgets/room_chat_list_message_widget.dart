part of room_chat_widgets;

class RoomChatListMessageWidget extends GetView<RoomChatScreenController> {
  const RoomChatListMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppPadding(
        padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
        child: Obx(() {
          final messageChats = controller.lstChatMessage.toList();
          return ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: messageChats.length,
              itemBuilder: (context, index) {
                final messageItem = messageChats[index];
                final isCurrentUser =
                    messageItem.senderId == controller.senderUser.uid;
                return MessageItemWidget(
                    avatarUrl: null,
                    messageChat: messageItem,
                    isCurrentUser: isCurrentUser);
              });
        }),
      ),
    );
  }
}
