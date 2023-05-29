import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';

class HomeCardItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  HomeCardItem(
      {Key? key,
      required this.title,
      required this.value,
      required this.icon,
      required this.backgroundColor,
      required this.foregroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundCardColor = isDarkMode ? ThemeColors.backgroundTextFormDark() : ThemeColors.backgroundTextFormLight;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.25), blurRadius: 4, offset: Offset(0, 4))
          ],
          color: backgroundCardColor),
      margin: EdgeInsets.only(bottom: AppGapSize.medium.size),
      child: AppPadding.medium(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: foregroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              height: MediaQuery.of(context).size.shortestSide * 0.15,
              width: MediaQuery.of(context).size.shortestSide * 0.15,
              alignment: Alignment.center,
              child: Icon(icon, size: MediaQuery.of(context).size.shortestSide * 0.1, color: Colors.white),
            ),
            Expanded(
              child: AppPadding(
                padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppText.titleLarge(
                      text: value,
                      fontWeight: FontWeight.bold,
                      color: foregroundColor,
                    ),
                    AppText.bodyLarge(
                        text: title,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        color: context.theme.textTheme.bodySmall!.color!.withOpacity(0.8)),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: context.theme.colorScheme.onSurface.withOpacity(0.5),
                ))
          ],
        ),
      ),
    );
  }
}
