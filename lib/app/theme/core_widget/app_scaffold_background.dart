part of core_widget;

class AppScaffoldBackgroundImage extends AppScaffold {
  const AppScaffoldBackgroundImage(
      {super.key, required super.body, super.isLoading = false});

  @override
  Widget build(BuildContext context) {
    ThemeService controller = Get.find<ThemeService>();

    return Scaffold(body: Obx(() {
      final backgroundUrl = controller.isDarkTheme.value
          ? AppImageAssets.backgroundDark
          : AppImageAssets.backgroundLight;
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
