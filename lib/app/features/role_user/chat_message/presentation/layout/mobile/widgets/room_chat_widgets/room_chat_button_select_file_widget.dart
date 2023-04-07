import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/widgets/animated_floating_buttons.dart';

class RoomChatButtonSelectFileWidget extends GetView<RoomChatScreenController> {
  const RoomChatButtonSelectFileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listImage = controller.lstImageFile.value;
      if (listImage.isNotEmpty) return SizedBox.shrink();
      return SizedBox(
        height: kToolbarHeight * 10,
        width: kToolbarHeight,
        child: AnimatedFloatingButtons(
            onPressedCallBack: (index) {
              if (index == 2) {
                return controller.onPressedSelectImages();
              }
              return controller.onPressedAttachFile();
            },
            iconItems: [
              FontAwesomeIcons.fileLines,
              FontAwesomeIcons.filePdf,
              FontAwesomeIcons.image,
              FontAwesomeIcons.fileVideo
            ],
            primaryButtonIcon: FontAwesomeIcons.fileArrowUp),
      );
    });
  }
}
