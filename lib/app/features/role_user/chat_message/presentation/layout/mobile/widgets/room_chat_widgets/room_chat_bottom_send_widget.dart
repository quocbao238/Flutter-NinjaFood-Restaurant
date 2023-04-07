import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';

class RoomChatBottomSendWidget extends GetView<RoomChatScreenController> {
  const RoomChatBottomSendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
        ),
        Obx(() {
          final lstImage = controller.lstImageFile.value;
          if (lstImage.isEmpty) {
            return SizedBox();
          }
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8),
            decoration:
                BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8), boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.background.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.background.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, -1), // changes position of shadow
              )
            ]),
            child: Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: [
              ...lstImage.map((e) {
                final index = lstImage.indexOf(e);
                return AppPadding.small(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(e, width: 100, height: 100, fit: BoxFit.cover),
                      ),
                      Positioned(
                          top: 4,
                          right: 4,
                          child: InkWell(onTap: () => controller.onRemoveImage(index), child: AppIcons.close()))
                    ],
                  ),
                );
              }).toList(),
              AppPadding.small(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                        onTap: () {},
                        // onTap: () => controller.onPickImage(),
                        child: Icon(FontAwesomeIcons.plus)),
                  ),
                ),
              ),
            ]),
          );
        }),
      ],
    );
  }
}
