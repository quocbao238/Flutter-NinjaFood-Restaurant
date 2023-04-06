import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_details/controller/chat_details_controller.dart';
import 'package:ninjafood/app/features/role_user/chat_details/presentation/mobile/widgets/message_item_widget.dart';

class ChatDetailsMobileView extends GetView<ChatDetailsController> {
  const ChatDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButtonBack(onPressed: controller.onPressedBack),
          Expanded(
              child: AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
                  child: Center(child: AppText.headlineSmall(maxLines: 1, text: controller.receiverUser.getName())))),
          SizedBox(width: 45, height: 45)
        ],
      ),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
                        return MessageItemWidget(
                          avatarUrl: null,
                          messageChat: messageItem,
                          isCurrentUser: isCurrentUser,
                        );
                      });
                }),
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () => controller.onSendMessage(), child: AppPadding.medium(child: AppIcons.sendMessage())),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
