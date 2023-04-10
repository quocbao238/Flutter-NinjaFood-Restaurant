import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/widgets/animation_grid.dart';

import 'category_item.dart';

class CategoryGridView extends StatelessWidget {
  final List<CategoryModel> menuList;
  final Function(CategoryModel categoryModel) onPressedMenu;

  const CategoryGridView({Key? key, required this.menuList, required this.onPressedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationGridView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppGapSize.medium.size,
        crossAxisSpacing: AppGapSize.medium.size,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuList.length,
      itemBuilder: (context, index, animation) {
        return CategoryItem(
          menuItem: menuList[index],
            onPressedMenu: onPressedMenu,
            animation: animation);
      },
    );
  }
}
