import 'package:flutter/material.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/features/role_user/chat/presentation/mobile/widgets/chat_item.dart';

class ChatList extends StatelessWidget {
  final List<GroupChatModel> groupChats;
  final Function(GroupChatModel) onTap;

  const ChatList({Key? key, required this.groupChats, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (groupChats.isEmpty) return Container();
    return AnimatedList(
      shrinkWrap: true,
      initialItemCount: groupChats.length,
      itemBuilder: (context, index, animation) {
        final _groupChatItem = groupChats[index];
        return ChatItem(
            animation: animation, groupChatItem: _groupChatItem, onTap: onTap);
      },
    );
  }
}
