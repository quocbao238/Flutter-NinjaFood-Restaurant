import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/widgets/app_network_image.dart';

class SearchFoodBar extends GetView<HomeController> {
  const SearchFoodBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
            prefixIcon: AppPadding.medium(
                child: AppIcons.search(color: ThemeColors.orangeColor)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              // borderSide: BorderSide(color: ThemeColors.orangeColor)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              // borderSide: BorderSide(color: ThemeColors.orangeColor)
            ),
            border: OutlineInputBorder(),
            hintText: 'What are you looking for?'),
      ),
      suggestionsCallback: (pattern) async {
        return await controller.searchFood(pattern);
      },
      itemBuilder: (context, ProductModel productModel) {
        return ListTile(
          leading: SizedBox(
              width: 48,
              height: 48,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: AppNetworkImage(url: productModel.image?.url ?? ''))),
          title: Text(productModel.name ?? ''),
          subtitle: Text(productModel.getPrice),
        );
      },
      onSuggestionSelected: (ProductModel productModel) =>
          controller.onSuggestionSelected(productModel),
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 8.0,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
