part of 'home_category_view.dart';


class CategoryGridView extends StatelessWidget {
  final List<CategoryModel> menuList;
  final Function(CategoryModel categoryModel) onPressedMenu;

  const CategoryGridView({Key? key, required this.menuList, required this.onPressedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppAnimationGridView(
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
