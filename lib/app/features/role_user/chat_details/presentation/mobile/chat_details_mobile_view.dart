import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_details/controller/chat_details_controller.dart';
import 'package:ninjafood/app/features/role_user/chat_details/presentation/mobile/widgets/message_item_widget.dart';

class ChatDetailsMobileView extends GetView<ChatDetailsController> {
  const ChatDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final userTo = controller.chatModel.value.userTo;
    final currentUser = controller.authController.currentUser!;
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButtonBack(onPressed: controller.onPressedBack),
          Expanded(child: AppPadding.medium(child: AppText.headlineSmall(maxLines: 1, text: userTo.getName()))),
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
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: messageChats.length,
                      itemBuilder: (context, index) {
                        final messageItem = messageChats[index];
                        final isCurrentUser = messageItem.idUserFrom == currentUser.uid;
                        return MessageItemWidget(
                          messageChat: messageItem,
                          isCurrentUser: isCurrentUser,
                        );
                      });
                }),
              ),
            ),
            TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                suffixIcon: AppPadding.medium(child: AppIcons.sendMessage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
