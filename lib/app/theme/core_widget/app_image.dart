part of core_widget;

enum AppImage {
  logo(AppImageAssets.logo);

  final String url;

  const AppImage(this.url);
}

class AppImages extends StatelessWidget {
  final AppImage appImage;

  AppImages(this.appImage);

  AppImages.logo({this.appImage = AppImage.logo});

  @override
  Widget build(BuildContext context) {
    return Image.asset(appImage.url);
  }
}
