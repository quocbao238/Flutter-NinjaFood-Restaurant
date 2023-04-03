import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chatList = ChatModel.chatList;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: AppButtonDrawer(
          onPressed: () {},
        ),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.small),
                child: AppText.headlineSmall(
                  text: 'Chat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                child: AppSizeScale(
                  ratioHeight: 0.75,
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      final _chatList = chatList[index];
                      return AppPadding(
                        padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Material(
                            child: InkWell(
                              onTap: () {},
                              child: ColoredBox(
                                color: isDarkMode
                                    ? ThemeColors.backgroundTextFormDark()
                                    : Theme.of(context).colorScheme.onPrimary,
                                child: AppSizeScale(
                                  ratioHeight: 0.1,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppPadding.small(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child:
                                                Image.asset(_chatList.image)),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AppPadding(
                                          padding: AppEdgeInsets.only(
                                              left: AppGapSize.small,
                                              top: AppGapSize.small),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText.bodyLarge(
                                                  text: _chatList.name,
                                                  fontWeight: FontWeight.w400),
                                              AppText.bodyMedium(
                                                  text:
                                                      _chatList.currentMessage,
                                                  fontWeight: FontWeight.w400),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: AppPadding(
                                            padding: AppEdgeInsets.only(
                                                top: AppGapSize.small,
                                                right: AppGapSize.small),
                                            child: AppText.bodyMedium(
                                                text: _chatList.time),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
