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
  final VoidCallback? onPressBackButton;

  AppScaffoldBackgroundImage({
    super.key,
    this.onPressBackButton,
    required super.body,
    super.isLoading = false,
    this.type = BackgroundImageType.normal,
  });

  @override
  Widget build(BuildContext context) {
    ThemeService controller = Get.find<ThemeService>();

    return Scaffold(
      body: Obx(
        () {
          final backgroundUrl = controller.isDarkTheme.value
              ? type!.backgroundDark
              : type!.backgroundLight;
          return AppSizeScale(
            ratioWidth: 1,
            ratioHeight: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(backgroundUrl), fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppButtonBack(onPressed: onPressBackButton),
                        Expanded(child: body),
                      ],
                    ),
                  ),
                  AppLoading(isLoading: isLoading),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
