import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';

class RoomChatBottomSendWidget extends GetView<RoomChatScreenController> {
  const RoomChatBottomSendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: TextField(
        textInputAction: TextInputAction.send,
        onSubmitted: (value) => controller.onSendMessage(),
        style: Theme.of(context).textTheme.bodyMedium,
        controller: controller.textEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
          prefixIcon: SizedBox(width: kToolbarHeight, height: kToolbarHeight),
          suffixIcon: InkWell(
            onTap: () => controller.onSendMessage(),
            child: AppPadding.medium(child: AppIcons.sendMessage()),
          ),
        ),
      ),
    );
  }
}
