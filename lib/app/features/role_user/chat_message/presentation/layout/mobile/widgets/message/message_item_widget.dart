import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/presentation/layout/mobile/widgets/message/message_item_type.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/widgets/widgets.dart';

class MessageItemWidget extends StatelessWidget {
  final MessageChat messageChat;
  final bool isCurrentUser;
  final String? avatarUrl;

  const MessageItemWidget({super.key, required this.messageChat, required this.isCurrentUser, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isSendMessage = isCurrentUser;
    final boxColor = isSendMessage
        ? null
        : isDarkMode
            ? ThemeColors.backgroundTextFormDark()
            : Theme.of(context).colorScheme.onPrimary;
    final gradientColor = isSendMessage ? ThemeColors.gradientButtonColor : null;
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
                  child: AppNetworkImage(width: kToolbarHeight / 2, height: kToolbarHeight / 2, url: avatarUrl ?? ''),
                ),
              Expanded(
                  child: MessageItemType(messageChat: messageChat, gradientColor: gradientColor, boxColor: boxColor)),
            ],
          ),
        ),
      ),
    );
  }
}
