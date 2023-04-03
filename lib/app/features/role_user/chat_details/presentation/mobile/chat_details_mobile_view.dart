import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat/presentation/mobile/widgets/receive_message.dart';
import 'package:ninjafood/app/features/role_user/chat/presentation/mobile/widgets/send_message.dart';
import 'package:ninjafood/app/features/role_user/chat_details/controller/chat_details_controller.dart';

class ChatDetailsMobileView extends GetView<ChatDetailsController> {
  const ChatDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppScaffoldBackgroundImage.pattern(
      onPressBackButton: controller.onPressedback,
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
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
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(controller.chatModel.image)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText.bodyLarge(
                                      text: controller.chatModel.name,
                                      fontWeight: FontWeight.w400,
                                      maxLines: 1,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 6,
                                          width: 6,
                                          child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      ThemeColors.gradientButtonColor,
                                                  shape: BoxShape.circle)),
                                        ),
                                        AppPadding(
                                          padding: AppEdgeInsets.only(
                                              left: AppGapSize.small),
                                          child: AppText.bodyMedium(
                                            text: 'Online',
                                            fontWeight: FontWeight.w400,
                                            maxLines: 2,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color!
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ReceiveMessage(),
                          SendMessageBox(),
                          ReceiveMessage(),
                          SendMessageBox(),
                          ReceiveMessage(),
                          SendMessageBox(),
                          ReceiveMessage(),
                          SendMessageBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                suffixIcon: AppPadding.medium(child: AppIcons.sendMessage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
