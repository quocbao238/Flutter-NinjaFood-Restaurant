import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/tabs/controllers/tabs_controller.dart';

class AppDrawerHeader extends GetView<TabsController> {
  const AppDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSizeScale(
      ratioWidth: 0.5,
      child: Obx(
        () {
          final currentUser = controller.authController.currentUser;
          return AppPadding.small(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (currentUser?.photoUrl != null)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(900),
                      border: Border.all(width: 1, color: Theme.of(context).colorScheme.onBackground),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.4),
                          blurRadius: 8,
                          offset: Offset(-4, 4),
                        ),
                        BoxShadow(
                            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.4),
                            blurRadius: 8,
                            offset: Offset(4, -4))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(900),
                          border: Border.all(width: 1, color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.network(
                            currentUser?.photoUrl ?? '',
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.width * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                AppPadding(
                  padding: AppEdgeInsets.only(top: AppGapSize.medium, bottom: AppGapSize.small),
                  child: AppText.titleLarge(
                    text: (currentUser?.firstName ?? '') + " " + (currentUser?.lastName ?? ''),
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryColor,
                  ),
                ),
                AppText.labelMedium(
                    text: currentUser?.email ?? '',
                    color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.8)),
              ],
            ),
          );
        },
      ),
    );
  }
}
