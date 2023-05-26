import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';

class ProductFavoriteItem extends StatelessWidget {
  final int productId;
  final Function(int) onPressedFavorite;

  const ProductFavoriteItem({Key? key, required this.productId, required this.onPressedFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressedFavorite(productId),
      child: Obx(
        () {
          final favoriteController = FavoriteController.instance;
          final isFavorite = favoriteController.checkProductIsFavorite(productId);
          final iconColor = isFavorite ? ThemeColors.textRedColor : ThemeColors.textDarkColor;
          return DecoratedBox(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary.withOpacity(0.1)),
              child: AppPadding.small(child: Icon(FontAwesomeIcons.heartCircleCheck, color: iconColor, size: 16)));
        },
      ),
    );
  }
}
