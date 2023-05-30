import 'package:flutter/material.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:ninja_theme/ninja_theme.dart';

class LocationPickerMobileView extends StatefulWidget {
  const LocationPickerMobileView({Key? key}) : super(key: key);

  @override
  State<LocationPickerMobileView> createState() => _LocationPickerMobileViewState();
}

class _LocationPickerMobileViewState extends State<LocationPickerMobileView> {
  String? address;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MapLocationPicker(
      showBackButton: false,
      showMoreOptions: false,
      currentLatLng: LatLng(10.7735994, 106.6944173),
      bottomCardTooltip: 'SetLocationScreen_Title'.tr,
      bottomCardIcon: Icon(Icons.check, color: isDark ? Colors.white : ThemeColors.textLightColor),
      backButton: Container(
        width: 53,
        height: 45,
        padding: const EdgeInsets.only(left: 8.0),
        child: ElevatedButton(
          onPressed: () => Get.back(),
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(ThemeColors.backgroundIconColor()),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)))),
          child: const Center(child: AppIcons.back()),
        ),
      ),
      showButtonTypeMap: false,
      showButtonLocation: true,
      searchHintText: 'Tìm kiếm vị trí'.tr,
      bottomCardHintText: 'Nhấn vào bản đồ để chọn vị trí của bạn',
      mapType: MapType.normal,
      bottomCardColor: isDark ? Theme.of(context).primaryColor : ThemeColors.primaryColor,
      apiKey: FlutterConfigPlus.get('GOOGLE_MAPS_API_KEY'),
      onNext: (GeocodingResult? result) => Get.back(result: result?.formattedAddress),
      onSuggestionSelected: (PlacesDetailsResponse? result) => Get.back(result: result?.result.formattedAddress),
    );
  }
}
