

import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chatModel;
  final Animation<double> animation;
  final Function(ChatModel) onTap;
  const ChatItem({Key? key, required this.chatModel, required this.animation, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AnimationItem(
      animation: animation,
      child: AppPadding(
        padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Material(
            child: InkWell(
              onTap: onTap(chatModel),
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
                            borderRadius: BorderRadius.circular(8), child: Image.asset(chatModel.image)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText.bodyLarge(
                              text: chatModel.name,
                              fontWeight: FontWeight.w400,
                              maxLines: 1,
                            ),
                            AppText.bodyMedium(
                              text: chatModel.currentMessage,
                              fontWeight: FontWeight.w400,
                              maxLines: 2,
                              color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      AppPadding(
                        padding: AppEdgeInsets.only( left: AppGapSize.medium),
                        child: AppText.bodyMedium(text: chatModel.time),
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
