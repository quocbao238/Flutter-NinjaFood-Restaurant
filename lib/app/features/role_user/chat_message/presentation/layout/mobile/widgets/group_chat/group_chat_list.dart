import 'package:flutter/material.dart';
import 'package:ninjafood/app/models/chat_model.dart';

import 'group_chat_item.dart';

class GroupChatList extends StatelessWidget {
  final List<GroupChatModel> groupChats;
  final Function(GroupChatModel) onTap;

  const GroupChatList({Key? key, required this.groupChats, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (groupChats.isEmpty) return Container();
    return AnimatedList(
      shrinkWrap: true,
      initialItemCount: groupChats.length,
      itemBuilder: (context, index, animation) {
        final _groupChatItem = groupChats[index];
        return GroupChatItem(
            animation: animation, groupChatItem: _groupChatItem, onTap: onTap);
      },
    );
  }
}
