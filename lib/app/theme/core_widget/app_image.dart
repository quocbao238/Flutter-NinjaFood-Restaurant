part of core_widget;

enum AppImage {
  logo(AppImageAssets.logoLight);

  final String url;

  const AppImage(this.url);
}

class AppImages extends StatelessWidget {
  final AppImage appImage;

  AppImages(this.appImage);

  AppImages.logo({this.appImage = AppImage.logo});

  @override
  Widget build(BuildContext context) {
    if (appImage == AppImage.logo) {
      return GetX<ThemeService>(
        init: ThemeService(prefsService: Get.find()),
        builder: (controller) {
          final url = controller.isDarkTheme.value
              ? AppImageAssets.logoDark
              : appImage.url;
          return Image.asset(url);
        },
      );
    }
    return Image.asset(appImage.url);
  }
}
