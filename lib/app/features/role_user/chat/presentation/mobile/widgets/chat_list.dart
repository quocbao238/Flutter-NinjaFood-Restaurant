import 'package:flutter/material.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/features/role_user/chat/presentation/mobile/widgets/chat_item.dart';

class ChatList extends StatelessWidget {
  final List<ChatModel> listChat;
  final Function(ChatModel) onTap;

  const ChatList({Key? key, required this.listChat, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listChat.isEmpty) return Container();
    return AnimatedList(
      shrinkWrap: true,
      initialItemCount: listChat.length,
      itemBuilder: (context, index, animation) {
        final _chatItem = listChat[index];
        return ChatItem(
          animation: animation,
          chatItem: _chatItem,
          onTap: onTap,
        );
      },
    );
  }
}
