import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';

class HomeViewTypeMenus extends GetView<HomeController> {
  const HomeViewTypeMenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularMenuList = controller.popularMenu;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppPadding(
          padding: AppEdgeInsets.only(
              left: AppGapSize.medium, bottom: AppGapSize.small),
          child: AppText.bodyLarge(
            text: 'Popular Menu'.tr,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: popularMenuList.length,
            itemBuilder: (context, index) {
              final _listMenu = popularMenuList[index];
              return AppPadding.small(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AppSizeScale(
                    backgroundColor: isDarkMode
                        ? ThemeColors.backgroundTextFormDark()
                        : Theme.of(context).colorScheme.onPrimary,
                    // ratioWidth: 0.4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            _listMenu.image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        AppPadding.small(
                          child: AppText.bodyLarge(
                            text: _listMenu.name.toString(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
