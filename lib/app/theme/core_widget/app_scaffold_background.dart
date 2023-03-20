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

  AppScaffoldBackgroundImage({
    super.key,
    required super.body,
    super.isLoading = false,
    this.type = BackgroundImageType.normal,
  });

  @override
  Widget build(BuildContext context) {
    ThemeService controller = Get.find<ThemeService>();

    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   // elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: SizedBox(
      //     width: 45,
      //     height: 45,
      //     child: DecoratedBox(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(15),
      //         color: Color(0xFFF9A84D).withOpacity(0.1),
      //       ),
      //       child: Center(
      //         child: Icon(
      //           Icons.arrow_back_ios,
      //           color: Color(0xFFDA6317),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Obx(
        () {
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
                AppLoading(isLoading: isLoading),
                Positioned(
                  top: 35,
                  left: 28,
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFF9A84D).withOpacity(0.1),
                      ),
                      child: Center(
                        child: AppIcons.back(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
