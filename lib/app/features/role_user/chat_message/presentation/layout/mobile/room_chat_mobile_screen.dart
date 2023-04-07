import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/chat_message/presentation/layout/mobile/widgets/message/message_item_widget.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class RoomChatMobileScreen extends GetView<RoomChatScreenController> {
  const RoomChatMobileScreen({super.key});

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
          AppPadding(
            padding: const AppEdgeInsets.only(
                top: AppGapSize.paddingMedium,
                left: AppGapSize.paddingMedium,
                right: AppGapSize.paddingMedium,
                bottom: AppGapSize.regular),
            child: SizedBox(
              width: 45,
              height: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: AppNetworkImage(url: controller.receiverUser.photoUrl ?? ''),
              ),
            ),
          )
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
                            avatarUrl: null, messageChat: messageItem, isCurrentUser: isCurrentUser);
                      });
                }),
              ),
            ),
            AppPadding(
              padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: TextField(
                textInputAction: TextInputAction.send,
                onSubmitted: (value) => controller.onSendMessage(),
                style: Theme.of(context).textTheme.bodyMedium,
                controller: controller.textEditingController,
                decoration: InputDecoration(
                    prefixIcon: InkWell(
                        onTap: () => controller.onPressedAttachFile(),
                        child: AppPadding.medium(child: Icon(FontAwesomeIcons.file))),
                    suffixIcon: InkWell(
                        onTap: () => controller.onSendMessage(),
                        child: AppPadding.medium(child: AppIcons.sendMessage()))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
