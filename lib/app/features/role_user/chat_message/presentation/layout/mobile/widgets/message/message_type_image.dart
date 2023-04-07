import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'message_type_text.dart';

class ChatMessageImage extends StatefulWidget {
  final MessageChatFile messageChat;
  final String timestamp;

  const ChatMessageImage({Key? key, required this.messageChat, required this.timestamp}) : super(key: key);

  @override
  State<ChatMessageImage> createState() => _ChatMessageImageState();
}

class _ChatMessageImageState extends State<ChatMessageImage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        AppPadding.small(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: CachedNetworkImage(imageUrl: widget.messageChat.fileUrl))),
        ChatMessageText(message: widget.messageChat.message, timestamp: widget.timestamp)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}