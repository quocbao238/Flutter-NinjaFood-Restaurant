part of core_widget;

enum BackgroundImageType {
  splash(AppImageAssets.backgroundDark, AppImageAssets.backgroundLight),
  normal(AppImageAssets.backgroundPattern, AppImageAssets.backgroundPattern);

  final String backgroundDark;
  final String backgroundLight;
  const BackgroundImageType(this.backgroundDark, this.backgroundLight);
}

class AppScaffoldBackgroundImage extends AppScaffold {
  final BackgroundImageType? type;

  const AppScaffoldBackgroundImage({
    super.key,
    required super.body,
    super.isLoading = false,
    this.type = BackgroundImageType.normal,
  });

  @override
  Widget build(BuildContext context) {
    ThemeService controller = Get.find<ThemeService>();

    return Scaffold(body: Obx(() {
      final backgroundUrl = controller.isDarkTheme.value
          ? type!.backgroundDark
          : type!.backgroundLight;
      return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundUrl), fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AppSizeScale(ratioWidth: 1, ratioHeight: 1, child: body),
            AppLoading(isLoading: isLoading)
          ],
        ),
      );
    }));
  }
}
