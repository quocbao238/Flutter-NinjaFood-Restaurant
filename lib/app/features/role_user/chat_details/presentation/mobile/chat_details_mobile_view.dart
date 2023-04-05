import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_details/controller/chat_details_controller.dart';
import 'package:ninjafood/app/features/role_user/chat_details/presentation/mobile/widgets/receive_message.dart';
import 'package:ninjafood/app/features/role_user/chat_details/presentation/mobile/widgets/send_message.dart';

class ChatDetailsMobileView extends GetView<ChatDetailsController> {
  const ChatDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final receiverUser = controller.chatModel.value.receiverUser;
    final currentUser = controller.authController.currentUser;
    final adminUser = controller.authController.adminUser;
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButtonBack(onPressed: controller.onPressedBack),
          Expanded(child: AppPadding.medium(child: AppText.headlineSmall(maxLines: 1, text: receiverUser.getName()))),
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
                  final messageChats = controller.chatModel.value.messageChats ?? [];
                  if (messageChats.isEmpty) {
                    return AppText.bodyMedium(text: 'No message');
                  }
                  return AnimationList(
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: messageChats.length,
                      itemBuilder: (context, index, animation) {
                        final messageItem = messageChats[index];
                        final isCurrentUser = messageItem.senderId == currentUser!.uid;
                        final avatarUrl = isCurrentUser ? null : adminUser!.photoUrl;
                        return AnimationItem(
                          animation: animation,
                          child: MessageItemWidget(
                            avatarUrl: avatarUrl,
                            messageChat: messageItem,
                            isCurrentUser: isCurrentUser,
                          ),
                        );
                      });
                }),
              ),
            ),
            TextField(
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              controller: controller.textEditingController,
              decoration: InputDecoration(

                suffixIcon:
                InkWell(onTap: () => controller.onSendMessage(), child: AppPadding.medium(child: AppIcons.sendMessage())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
