import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class ImagePreviewScreen extends GetView<RoomChatScreenController> {
  final String url;

  const ImagePreviewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(
        title: 'Image_Preview'.tr,
        trailingWidget: AppPadding(
          padding: const AppEdgeInsets.only(
              top: AppGapSize.paddingMedium,
              left: AppGapSize.paddingMedium,
              right: AppGapSize.paddingMedium),
          child: SizedBox(
            width: 45,
            height: 45,
            child: ElevatedButton(
              onPressed: () => controller.downloadFile(url),
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                        ThemeColors.backgroundIconColor()),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                  ),
              child: const Center(
                  child: Icon(FontAwesomeIcons.download,
                      color: ThemeColors.orangeColor, size: 16)),
            ),
          ),
        ),
      ),
      body: AppPadding(
        padding: AppEdgeInsets.only(
            top: isIos ? AppGapSize.none : AppGapSize.veryLarge,
            left: AppGapSize.medium,
            right: AppGapSize.medium,
            bottom: AppGapSize.veryLarge),
        child: AppNetworkImage(
          borderRadius: 16.0,
          width: MediaQuery.of(context).size.width,
          url: url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
