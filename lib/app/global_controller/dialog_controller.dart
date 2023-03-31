part of global_controller;

class DialogController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  final milliseconds = 200;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  Future<void> warning(
      {String? title,
      required String message,
      VoidCallback? leftBtnOnPressed,
      VoidCallback? rightBtnOnPressed,
      String? leftBtnText,
      String? rightBtnText}) async {
    _animationController.forward();
    await Get.dialog(
        AppDialog.warning(
          title: title ?? 'Warning',
          message: message,
          animation: _animation,
          leftBtnText: leftBtnText ?? 'Cancel',
          rightBtnText: rightBtnText ?? 'OK',
          leftBtnOnPressed: leftBtnOnPressed == null
              ? null
              : () {
                  leftBtnOnPressed.call();
                  _hide();
                },
          rightBtnOnPressed: rightBtnOnPressed == null
              ? null
              : () {
                  rightBtnOnPressed.call();
                  _hide();
                },
        ),
        barrierDismissible: false);
  }

  Future<void> showSuccess(
      {String? title,
      required String message,
      VoidCallback? rightBtnOnPressed,
      String? rightBtnText}) async {
    _animationController.forward();
    await Get.dialog(
        AppDialog.success(
          title: title ?? 'Success',
          message: message,
          animation: _animation,
          rightBtnText: rightBtnText ?? 'OK',
          rightBtnOnPressed: () {
            rightBtnOnPressed?.call();
            _hide();
          },
        ),
        barrierDismissible: false);
  }

  Future<void> showError({String? title, required String message}) async {
    _animationController.forward();
    await Get.dialog(
        AppDialog.error(
            title: title ?? 'Error',
            message: message,
            animation: _animation,
            rightBtnText: 'OK',
            rightBtnOnPressed: () => _hide()),
        barrierDismissible: false);
  }

  void _hide() {
    _animationController.reverse();
    Future.delayed(Duration(milliseconds: milliseconds), () {
      if (Get.isDialogOpen ?? false) Get.back();
    });
  }
}
