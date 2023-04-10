import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';

import 'widgets/room_chat_widgets/room_chat_widgets.dart';

class RoomChatMobileScreen extends GetView<RoomChatScreenController> {
  const RoomChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: RoomChatAppBarWidget(),
      body: AppPadding(
        padding: AppEdgeInsets.only(left: AppGapSize.medium, right: AppGapSize.medium, bottom: AppGapSize.medium),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(children: [RoomChatListMessageWidget(), RoomChatBottomSendWidget()]),
            RoomChatButtonSelectFileWidget(),
          ],
        ),
      ),
    );
  }
}
