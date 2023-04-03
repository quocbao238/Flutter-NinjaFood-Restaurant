

import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';

class ChatList extends StatelessWidget {
  final List<ChatModel> chatList;
  final Function(ChatModel) onTap;
  const ChatList({Key? key, required this.chatList, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AnimatedList(
      shrinkWrap: true,
      initialItemCount: chatList.length,
      itemBuilder: (context, index, animation) {
        final _chatList = chatList[index];
        return AnimationItem(
          animation: animation,
          child: AppPadding(
            padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Material(
                child: InkWell(
                  onTap: onTap(_chatList),
                  child: ColoredBox(
                    color: isDarkMode
                        ? ThemeColors.backgroundTextFormDark()
                        : Theme.of(context).colorScheme.onPrimary,
                    child: AppPadding.medium(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppPadding(
                            padding: AppEdgeInsets.only(right: AppGapSize.medium),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8), child: Image.asset(_chatList.image)),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText.bodyLarge(
                                  text: _chatList.name,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 1,
                                ),
                                AppText.bodyMedium(
                                  text: _chatList.currentMessage,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 2,
                                  color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                          AppPadding(
                            padding: AppEdgeInsets.only( left: AppGapSize.medium),
                            child: AppText.bodyMedium(text: _chatList.time),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
