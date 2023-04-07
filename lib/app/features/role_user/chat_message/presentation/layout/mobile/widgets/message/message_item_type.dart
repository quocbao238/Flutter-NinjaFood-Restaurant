import 'package:flutter/material.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'message_type_image.dart';
import 'message_type_pdf.dart';
import 'message_type_text.dart';
import 'message_type_video.dart';

class MessageItemType extends StatelessWidget {
  final MessageChat messageChat;
  final LinearGradient? gradientColor;
  final Color? boxColor;

  const MessageItemType({Key? key, required this.messageChat, required this.gradientColor, required this.boxColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), gradient: gradientColor, color: boxColor),
      child: Builder(
        builder: (context) {
          if (messageChat.messageChatType == MessageChatType.text) {
            return ChatMessageText(message: messageChat.message, timestamp: messageChat.timestamp);
          }

          if (messageChat.messageChatType == MessageChatType.image) {
            final messageChatFile = MessageChatFile.fromJson(messageChat.message);
            return ChatMessageImage(messageChat: messageChatFile, timestamp: messageChat.timestamp);
          }

          if (messageChat.messageChatType == MessageChatType.video) {
            final messageChatFile = MessageChatFile.fromJson(messageChat.message);
            return ChatMessageVideo(messageChat: messageChatFile);
          }

          if (messageChat.messageChatType == MessageChatType.pdf) {
            final messageChatFile = MessageChatFile.fromJson(messageChat.message);
            return ChatMessagePDFView(messageChat: messageChatFile);
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
