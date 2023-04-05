import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class MessageItemWidget extends StatelessWidget {
  final MessageChat messageChat;
  final bool isCurrentUser;
  final String? avatarUrl;

  const MessageItemWidget({super.key, required this.messageChat, required this.isCurrentUser, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isSendMessage = isCurrentUser;
    return AppPadding(
      padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
      child: Align(
        alignment: isSendMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (avatarUrl != null)
                AppPadding(
                  padding: AppEdgeInsets.only(right: AppGapSize.medium),
                  child: SizedBox(
                    width: kToolbarHeight / 2,
                    height: kToolbarHeight / 2,
                    child: AppNetworkImage(url: avatarUrl ?? ''),
                  ),
                ),
              Expanded(
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
                      AppPadding.small(
                          child: AppText.bodyMedium(text: messageChat.message, textAlign: TextAlign.start)),
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
            ],
          ),
        ),
      ),
    );
  }
}
