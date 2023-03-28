part of global_controller;

class DialogController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  final milliseconds = 200;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: milliseconds));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  void showError({String? title, required String message}) {
    _animationController.forward();
    Get.dialog(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ScaleTransition(
            scale: _animation,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Get.theme.colorScheme.primary.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Get.theme.colorScheme.primary.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              child: AppSizeScale(
                ratioWidth: 0.75,
                child: AppPadding.medium(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppPadding.small(
                          child: AppText.titleMedium(
                        text: title ?? 'Error Message',
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.textRedColor,
                      )),
                      AppPadding(
                        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small, vertical: AppGapSize.medium),
                        child: AppText.bodyMedium(
                          text: message,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Get.theme.colorScheme.primary.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: _hide,
                            child: AppText.bodySmall(text: 'OK'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _hide() {
    _animationController.reverse();
    Future.delayed(Duration(milliseconds: milliseconds), () => Get.back());
  }
}
