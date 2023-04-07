import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class RoomChatAppBarWidget extends GetView<RoomChatScreenController> {
  const RoomChatAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
