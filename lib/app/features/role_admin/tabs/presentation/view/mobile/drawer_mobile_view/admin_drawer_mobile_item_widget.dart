part of 'admin_drawer_mobile_view.dart';

class AdminDrawerItemWidget extends StatelessWidget {
  final bool isSelected;
  final MenuItem menuItem;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;

  const AdminDrawerItemWidget(
      {Key? key,
      required this.isSelected,
      required this.menuItem,
      this.onTap,
      this.backgroundColor,
      this.border,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = menuItem.title;
    if (menuItem.menuType == MenuType.changeTheme) {
      title = Get.isDarkMode ? "Drawer_Theme_Light" : "Drawer_Theme_Dark";
      title = title.tr;
    }
    final shadowColor = Get.isDarkMode ? Colors.white : Colors.black;
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ??
                (isSelected
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
                    : null),
            borderRadius: BorderRadius.circular(8),
            border: border,
            boxShadow: !isSelected
                ? null
                : [
                    BoxShadow(
                        color: shadowColor.withOpacity(0.15),
                        blurRadius: 4,
                        offset: Offset(0, 4)),
                    BoxShadow(
                        color: shadowColor.withOpacity(0.15),
                        blurRadius: 4,
                        offset: Offset(0, -4)),
                    BoxShadow(
                        color: shadowColor.withOpacity(0.15),
                        blurRadius: 4,
                        offset: Offset(-4, 0)),
                    BoxShadow(
                        color: shadowColor.withOpacity(0.15),
                        blurRadius: 4,
                        offset: Offset(4, 0)),
                  ],
          ),
          child: GestureDetector(
            onTap: () => onTap?.call(),
            child: ListTile(
              iconColor: ThemeColors.primaryColor,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: alignment ?? Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      menuItem.iconData,
                      color: isSelected ? ThemeColors.textDarkColor : null,
                      size: Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                    AppPadding(
                      padding: AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium),
                      child: Text(
                        title.tr,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: isSelected
                                  ? ThemeColors.textDarkColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .color,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              selected: isSelected,
              // onTap: () => onTap?.call(),
            ),
          ),
        ),
      ),
    );
  }
}
