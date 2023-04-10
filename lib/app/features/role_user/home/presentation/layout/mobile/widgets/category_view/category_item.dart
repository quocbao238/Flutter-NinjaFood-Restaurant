import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel menuItem;
  final Function(CategoryModel categoryModel) onPressedMenu;
  final Animation<double> animation;

  const CategoryItem(
      {Key? key,
      required this.onPressedMenu,
      required this.animation,
      required this.menuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final _menuName = menuItem.name ?? '';
    final _menuImage =
        homeController.getImageUrlByProductId(menuItem.productIds![1]);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => onPressedMenu(menuItem),
      child: AnimationItem(
        animation: animation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AppSizeScale(
            backgroundColor: isDarkMode
                ? ThemeColors.backgroundTextFormDark()
                : Theme.of(context).colorScheme.onPrimary,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(_menuImage, fit: BoxFit.cover),
                ),
                AppPadding.small(
                  child: AppText.bodyLarge(
                      text: _menuName, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
