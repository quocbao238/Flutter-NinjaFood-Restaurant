import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

import 'widgets/room_chat_widgets/room_chat_widgets.dart';

class RoomChatMobileScreen extends GetView<RoomChatScreenController> {
  const RoomChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        appBarWidget: CustomAppBar.back(
          title: controller.receiverUser.getName(),
          trailingWidget: AppPadding(
              padding: const AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  left: AppGapSize.paddingMedium,
                  right: AppGapSize.paddingMedium),
              child: AppNetworkImage(
                  borderRadius: 96,
                  width: 45,
                  height: 45,
                  url: controller.receiverUser.photoUrl ?? '')),
        ),
        body: AppPadding(
          padding: AppEdgeInsets.only(
              left: AppGapSize.medium,
              right: AppGapSize.medium,
              bottom: AppGapSize.medium),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(children: [
                RoomChatListMessageWidget(),
                SafeArea(child: RoomChatBottomSendWidget())
              ]),
              SafeArea(child: RoomChatButtonSelectFileWidget()),
            ],
          ),
        ),
      );
    });
  }
}
