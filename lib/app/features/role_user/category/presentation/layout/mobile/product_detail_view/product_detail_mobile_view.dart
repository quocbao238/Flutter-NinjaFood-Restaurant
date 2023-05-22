import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_admin/tabs/controllers/admin_tabs_controller.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/product_detail_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'widgets/product_detail_mobile_widgets.dart';

class FoodDetailMobileView extends GetView<ProductDetailScreenController> {
  const FoodDetailMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isRoleUser =
        UserController.instance.currentUser.value?.isUser() ?? false;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: isRoleUser ? kTextTabBarHeight * 2 : 0),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProductDetailAppbar(
                      title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppButtonBack(onPressed: () => Get.back()),
                            if (!isRoleUser)
                              SafeArea(
                                child: AppPadding(
                                  padding: const AppEdgeInsets.only(
                                      top: AppGapSize.paddingMedium,
                                      left: AppGapSize.paddingMedium,
                                      right: AppGapSize.paddingMedium),
                                  child: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          controller.onPressedEditProduct(),
                                      style: Theme.of(context)
                                          .elevatedButtonTheme
                                          .style
                                          ?.copyWith(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    ThemeColors
                                                        .backgroundIconColor()),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0)),
                                            ),
                                          ),
                                      child: const Icon(Icons.edit,
                                          color: ThemeColors.orangeColor),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                      backgroundImage: Obx(
                        () {
                          final product = controller.currentProduct.value;
                          return HeaderImage(
                              image: product.image?.url ?? '',
                              enableDarkMode: true);
                        },
                      )),
                ),
                ProductDetailDescription(),
              ],
            ),
          ),
          if (isRoleUser)
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () {
                  final loading = controller.loading.value;
                  return Obx(() {
                    final isInCurrentCarts = controller.isInCarts.value;
                    final String textButton = isInCurrentCarts
                        ? 'Food_Already_In_Cart'.tr
                        : 'Add_To_Cart'.tr;
                    return AppPadding(
                      padding: AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical:
                              isIos ? AppGapSize.none : AppGapSize.medium),
                      child: SafeArea(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: AnimationButton(
                                duration: Duration(milliseconds: 300),
                                loading: loading,
                                textButton: textButton,
                                textDone: 'Add_To_Cart'.tr,
                                textLoading: 'Adding_To_Cart'.tr,
                                ratioWidthButton:
                                    isInCurrentCarts ? 0.65 : 0.85,
                                ratioWidthDone: 0.3,
                                ratioWidthLoading: 0.55,
                                onPressed: () {
                                  if (!isInCurrentCarts) {
                                    controller.addToCart();
                                  }
                                },
                              ),
                            ),
                            if (isInCurrentCarts && !loading)
                              Obx(() {
                                final counterCarts =
                                    controller.lstCurrentCart.length;
                                return CartItemWidget(
                                  counterCarts: counterCarts,
                                  onPressed: () {
                                    if (isRoleUser) {
                                      TabsController.instance
                                          .onChangeToCartScreen();
                                    } else {
                                      AdminTabsController.instance
                                          .onChangeToCartScreen();
                                    }
                                    Get.until((route) =>
                                        Get.currentRoute ==
                                        AppRouteProvider.tabScreen);
                                  },
                                );
                              })
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            )
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  final String image;
  final bool enableDarkMode;

  const HeaderImage(
      {Key? key, required this.image, this.enableDarkMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      color: enableDarkMode ? Colors.black.withOpacity(0.6) : null,
      colorBlendMode: enableDarkMode ? BlendMode.darken : null,
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final int counterCarts;
  final double? size;

  const CartItemWidget(
      {Key? key, this.onPressed, required this.counterCarts, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      height: 80,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ElevatedButton(
            onPressed: () => onPressed?.call(),
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: MaterialStateProperty.all(
                    ThemeColors.backgroundTextFormDark()),
                fixedSize: MaterialStateProperty.all(Size(64, 64)),
                maximumSize: MaterialStateProperty.all(Size(64, 64)),
                minimumSize: MaterialStateProperty.all(Size(64, 64)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
            child: Icon(FontAwesomeIcons.cartShopping,
                color: ThemeColors.primaryColor),
          ),
          if (counterCarts > 0)
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: ThemeColors.primaryColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(16)),
                    child: AppText.bodySmall(
                        text: counterCarts.toString(),
                        textAlign: TextAlign.center,
                        color: Theme.of(context).textTheme.bodySmall?.color)))
        ],
      ),
    );
  }
}
