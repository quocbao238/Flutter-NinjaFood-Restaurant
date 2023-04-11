part of product_detail_mobile_widgets;

class ProductDetailDescription extends GetView<ProductDetailController> {
  const ProductDetailDescription();

  @override
  Widget build(BuildContext context) {
    final product = controller.currentProduct;
    return SliverToBoxAdapter(
      child: AppSizeScale(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18), color: ThemeColors.primaryColor.withOpacity(0.1)),
                    child: AppPadding.small(
                      child: AppText.bodyMedium(
                        text: 'Popular',
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  AppIcons.locationMap(),
                  AppPadding(
                      padding: AppEdgeInsets.only(left: AppGapSize.small),
                      child: FavoriteItem(
                        productId: product.id ?? 0,
                        onPressedFavorite: (v) => controller.onPressedFavorite(v),
                      ))
                ],
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: AppText.headlineMedium(
                  text: product.name ?? '',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              AppText.headlineSmall(
                text: product.getPrice + ' ' + product.currency,
                color: ThemeColors.textPriceColor,
                textAlign: TextAlign.start,
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: AppText.bodyMedium(
                  text:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum''',
                  textAlign: TextAlign.start,
                ),
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: AppText.bodyLarge(
                  text: 'Testimonials',
                  fontWeight: FontWeight.bold,
                ),
              ),
              ProductDetailReviewer(),
            ],
          ),
        ),
      ),
    );
  }
}
