import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/globalController/message_controller.dart';

class MessageImageFullScreenView extends GetView<RoomChatScreenController> {
  final String url;

  const MessageImageFullScreenView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButtonBack(
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
                child: AppPadding(
                    padding: const AppEdgeInsets.only(top: AppGapSize.paddingMedium, bottom: AppGapSize.regular),
                    child: AppText.titleLarge(text: 'Image Preview'))),
            AppPadding(
              padding: const AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  left: AppGapSize.paddingMedium,
                  right: AppGapSize.paddingMedium,
                  bottom: AppGapSize.regular),
              child: SizedBox(
                width: 45,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => controller.downloadFile(url),
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStateProperty.all(ThemeColors.backgroundIconColor()),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                  child: const Center(child: Icon(FontAwesomeIcons.download, color: ThemeColors.orangeColor, size: 16)),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: CachedNetworkImage(
            imageUrl: url,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // Create button to download image
      ],
    ));
  }
}
