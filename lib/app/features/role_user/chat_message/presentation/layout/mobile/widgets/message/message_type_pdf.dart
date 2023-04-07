
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';

class ChatMessagePDFView extends StatelessWidget {
  final MessageChatFile messageChat;

  const ChatMessagePDFView({Key? key, required this.messageChat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(13), child: CachedNetworkImage(imageUrl: messageChat.fileUrl)),
        AppText.bodyMedium(text: messageChat.message, textAlign: TextAlign.start)
      ],
    );
  }
}
