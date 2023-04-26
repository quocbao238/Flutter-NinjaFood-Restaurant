import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/group_chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'widgets/group_chat/group_chat_list.dart';

class GroupChatMobileScreen extends GetView<GroupChatScreenController> {
  const GroupChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<TabsController>();
    return AppScaffoldBackgroundImage.pattern(
        floatActionButton: Obx(() {
          return controller.groupChats.isNotEmpty
              ? SizedBox.shrink()
              : FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => controller.handleOnTapChat(),
                  child: Icon(Icons.message, color: Colors.white),
                );
        }),
        appBarWidget: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButtonDrawer(onPressed: () => tabController.toggleDrawer()),
            Expanded(
                child: AppPadding(
                    padding: const AppEdgeInsets.only(
                        top: AppGapSize.paddingMedium,
                        left: AppGapSize.paddingMedium,
                        right: AppGapSize.paddingMedium,
                        bottom: AppGapSize.regular),
                    child: Center(
                        child: AppText.headlineSmall(
                            maxLines: 1, text: 'Drawer_Chat'.tr)))),
            AppPadding(
                padding: const AppEdgeInsets.only(
                    top: AppGapSize.paddingMedium,
                    left: AppGapSize.paddingMedium,
                    right: AppGapSize.paddingMedium,
                    bottom: AppGapSize.regular),
                child: SizedBox(width: 45, height: 45))
          ],
        ),
        body: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => GroupChatList(
                  groupChats: controller.groupChats.toList(),
                  onTap: controller.onTapChat))
            ],
          ),
        ));
  }
}
