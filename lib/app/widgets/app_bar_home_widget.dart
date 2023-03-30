import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class AppBarHomeWidget extends GetView<TabsController> {
  const AppBarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppButtonDrawer(onPressed: () {
              controller.toggleDrawer();
            }),
            const Expanded(
              child: AppPadding.medium(
                  child: AppText.headlineSmall(text: 'Find Your\nFavorite Food')),
            ),
            AppButtonNotification(onPressed: () {
              controller.onPressedNotification();
            }),

          ],
        ),
        AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    prefixIcon: AppIcons.search(),
                    hintText: 'What do you want to order?',
                    controller: TextEditingController(),
                  ),
                ),
                AppPadding(
                  padding: AppEdgeInsets.only(left: AppGapSize.small),
                  child: AppFilterButton(
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
        AppPadding.small()
      ],
    );
  }
}
