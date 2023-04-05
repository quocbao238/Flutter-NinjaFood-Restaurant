import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chatItem;
  final Animation<double> animation;
  final Function(ChatModel) onTap;

  const ChatItem({super.key, required this.chatItem, required this.animation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final messageChat = chatItem.messageChats.last;
    final receiverUser = chatItem.receiverUser;
    return AnimationItem(
      animation: animation,
      child: AppPadding(
        padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Material(
            child: InkWell(
              onTap: () => onTap(chatItem),
              child: ColoredBox(
                color: isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
                child: AppPadding.medium(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppPadding(
                        padding: AppEdgeInsets.only(right: AppGapSize.medium),
                        child: SizedBox(
                          width: kToolbarHeight,
                          height: kToolbarHeight,
                          child: AppNetworkImage(url: receiverUser.photoUrl ?? ''),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText.bodyLarge(
                              text: receiverUser.getName(),
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              maxLines: 1
                            ),
                            AppText.bodyMedium(
                              text: messageChat.message,
                              fontWeight: FontWeight.w400,
                              maxLines: 2,
                              color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      AppPadding(
                        padding: AppEdgeInsets.only(left: AppGapSize.medium),
                        child: AppText.bodyMedium(text: convertTimeStamp(messageChat.timestamp)),
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
  }
}
