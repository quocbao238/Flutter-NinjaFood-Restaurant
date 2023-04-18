part of 'widgets.dart';

class ProductSearchBar extends GetView<HomeController> {
  const ProductSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller.searchController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: AppGapSize.small.size, vertical: AppGapSize.small.size),
            prefixIcon: AppPadding.medium(child: AppIcons.search(color: ThemeColors.orangeColor)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: ThemeColors.orangeColor.withOpacity(0.6)),
            ),
            suffixIcon: Obx(() {
              if (!controller.showClearSearch.value) {
                return SizedBox.shrink();
              }
              return GestureDetector(
                onTap: controller.onPressedClearSearch,
                child: AppPadding.medium(child: AppIcons.close()),
              );
            }),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: ThemeColors.orangeColor.withOpacity(0.6)),
            ),
            border: OutlineInputBorder(),
            hintStyle: Theme.of(context).textTheme.labelLarge,
            hintText: 'What are you looking for?'),
      ),
      suggestionsCallback: (pattern) async => await controller.searchFood(pattern),
      errorBuilder: (context, error) => AppPadding.small(child: Text('No')),
      noItemsFoundBuilder: (context) {
        return AppPadding.regular(
            child: AppSizeScale(
          ratioWidth: 1,
          child: AppText.bodyMedium(
            text: 'No items found',
            textAlign: TextAlign.center,
          ),
        ));
      },
      suggestionsBoxVerticalOffset: 8.0,
      itemBuilder: (context, ProductModel productModel) {
        return Column(children: [
          ListTile(
            leading: AppNetworkImage(
                borderRadius: 8, width: kToolbarHeight, height: kToolbarHeight, url: productModel.image?.url ?? ''),
            title: AppText.titleSmall(text: productModel.name ?? '', textAlign: TextAlign.start),
            subtitle: AppText.bodyMedium(
                text: productModel.getPrice + ' ' + productModel.currency,
                color: ThemeColors.textPriceColor,
                textAlign: TextAlign.start),
          ),
          Divider(height: 1, color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(0.4))
        ]);
      },
      onSuggestionSelected: (ProductModel productModel) => controller.onSuggestionSelected(productModel),
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 8.0,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
