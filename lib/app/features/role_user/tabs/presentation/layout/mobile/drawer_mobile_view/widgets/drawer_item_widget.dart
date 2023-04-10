part of drawer_widgets;


class DrawerItemWidget extends StatelessWidget {
  final bool isSelected;
  final MenuItem menuItem;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;

  const DrawerItemWidget(
      {Key? key, required this.isSelected, required this.menuItem, this.onTap, this.backgroundColor, this.border, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = menuItem.title;
    if (menuItem.menuType == MenuType.changeTheme) {
      title = Get.isDarkMode ? "Light Theme" : "Dark Theme";
    }
    final shadowColor = Get.isDarkMode ? Colors.white : Colors.black;
    return AppPadding(
      padding: AppEdgeInsets.symmetric(
        horizontal: AppGapSize.small,
        // vertical: AppGapSize.small,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? (isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.8) : null),
          borderRadius: BorderRadius.circular(8),
          border: border,
          boxShadow: !isSelected
              ? null
              : [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.15),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: shadowColor.withOpacity(0.15),
                    blurRadius: 4,
                    offset: Offset(0, -4),
                  ),
                  BoxShadow(
                    color: shadowColor.withOpacity(0.15),
                    blurRadius: 4,
                    offset: Offset(-4, 0),
                  ),
                  BoxShadow(
                    color: shadowColor.withOpacity(0.15),
                    blurRadius: 4,
                    offset: Offset(4, 0),
                  ),
                ],
        ),
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: alignment ?? Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  menuItem.iconData,
                  color: isSelected ? ThemeColors.textDarkColor : null,
                  size: Theme.of(context).textTheme.bodyMedium!.fontSize,
                ),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
                  child: Text(
                    title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color:
                              isSelected ? ThemeColors.textDarkColor : Theme.of(context).textTheme.headlineSmall!.color,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
          selected: isSelected,
          onTap: () => onTap?.call(),
        ),
      ),
    );
  }
}
