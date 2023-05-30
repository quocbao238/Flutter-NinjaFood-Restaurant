import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

class ProductAddToCartWidget extends GetView<CartController> {
  final ProductModel productModel;

  ProductAddToCartWidget({required this.productModel});

  @override
  Widget build(BuildContext context) {

    final isAdmin =
        UserController.instance.currentUser.value?.isAdmin() ?? false;
    if (isAdmin) return const SizedBox();

    return Obx(() {
      bool isExist = controller.checkProductInCart(productModel.id ?? 0);
      return SizedBox(
        width: 36,
        height: 36,
        child: ElevatedButton(
          onPressed: () {
            if (!isExist) {
              UserController.instance
                  .addProductToCard(productModel: productModel);
              return;
            }
            TabsController.instance.onChangeToCartScreen();
            Get.until(
                    (route) => Get.currentRoute == AppRouteProvider.tabScreen);
          },
          style: Theme
              .of(context)
              .elevatedButtonTheme
              .style
              ?.copyWith(
              backgroundColor: MaterialStateProperty.all(
                  ThemeColors.backgroundTextFormDark()),
              fixedSize: MaterialStateProperty.all(Size(24, 24)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(96.0)))),
          child: Icon(
              !isExist
                  ? FontAwesomeIcons.cartPlus
                  : FontAwesomeIcons.cartShopping,
              color: !isExist
                  ? ThemeColors.textDarkColor
                  : ThemeColors.primaryColor,
              size: 12.0),
        ),
      );
    });
  }
}
