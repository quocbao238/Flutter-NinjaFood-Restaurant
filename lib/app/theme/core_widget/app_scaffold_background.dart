part of core_widget;

class AppScaffoldBackgroundImage extends AppScaffold {
  const AppScaffoldBackgroundImage({super.key, required super.body});

  @override
  Widget build(BuildContext context) {
    ThemeService controller = Get.find<ThemeService>();

    return Scaffold(body: Obx(() {
      final backgroundUrl = controller.isDarkTheme.value
          ? 'assets/images/background_dark_image.png'
          : 'assets/images/background_image.png';
      return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundUrl), fit: BoxFit.cover)),
        child: body,
      );
    }));
  }
}
