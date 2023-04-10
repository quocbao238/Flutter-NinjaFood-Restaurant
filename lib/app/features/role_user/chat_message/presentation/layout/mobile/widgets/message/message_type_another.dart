import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/presentation/layout/mobile/widgets/message/message_type_text.dart';
import 'package:ninjafood/app/helper/file_helper.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';

class ChatMessageAnotherView extends StatelessWidget {
  final MessageChatFile messageChat;
  final String timestamp;

  const ChatMessageAnotherView({Key? key, required this.messageChat, required this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final file = messageChat.lstFiles.first;
    final fileName = file.fileName;
    final fileExtension = file.fileName.split('.').last;
    final fileUrl = file.fileUrl;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppPadding.small(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                borderRadius: BorderRadius.circular(16)),
            child: AppPadding.small(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppPadding(
                          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                          child: AppText.bodySmall(
                            text: fileName,
                            maxLines: 2,
                          ),
                        ),
                        // Download Icon
                        IconButton(
                          icon: Icon(FontAwesomeIcons.download, size: 16, color: Theme.of(context).colorScheme.primary),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  //Icon File
                  AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: Icon(FileHelper.getIconByExtension(fileExtension),
                        size: 32, color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
        ChatMessageText(message: messageChat.message, timestamp: timestamp),
      ],
    );
  }
}
