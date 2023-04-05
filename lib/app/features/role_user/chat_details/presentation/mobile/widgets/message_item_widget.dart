import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';

class MessageItemWidget extends StatelessWidget {
  final MessageChat messageChat;
  final bool isCurrentUser;

  const MessageItemWidget({super.key, required this.messageChat, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isSendMessage = isCurrentUser;
    return AppPadding(
      padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
      child: Align(
        alignment: isSendMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.45),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: isSendMessage ? ThemeColors.gradientButtonColor : null,
              color: isSendMessage
                  ? null
                  : isDarkMode
                      ? ThemeColors.backgroundTextFormDark()
                      : Theme.of(context).colorScheme.onPrimary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPadding.small(child: AppText.bodyMedium(text: messageChat.content, textAlign: TextAlign.start)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AppPadding(
                    padding: AppEdgeInsets.only(right: AppGapSize.small, bottom: AppGapSize.small),
                    child: AppText.bodySmall(
                      text: convertTimeStampToHour(messageChat.timestamp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
