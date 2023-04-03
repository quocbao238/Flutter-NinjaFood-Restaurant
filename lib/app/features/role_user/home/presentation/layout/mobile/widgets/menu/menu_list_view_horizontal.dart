import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/menu/menu_item.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/widgets/animation_list.dart';

class MenuListViewHorizontal extends StatelessWidget {
  final List<CategoryModel> menuList;
  final Function(CategoryModel) onPressedMenu;

  const MenuListViewHorizontal(
      {Key? key, required this.menuList, required this.onPressedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSizeScale(
      ratioWidth: 1,
      ratioHeight: 0.2,
      child: AnimationList(
        scrollDirection: Axis.horizontal,
        itemCount: menuList.length,
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return AppPadding(
            padding: AppEdgeInsets.only(right: AppGapSize.paddingMedium),
            child: MenuItem(
                onPressedMenu: onPressedMenu,
                menuItem: menuList[index],
                animation: animation),
          );
        },
      ),
    );
  }
}
