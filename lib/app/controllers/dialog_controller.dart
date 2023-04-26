part of global_controller;

class DialogController extends GetxController
    with GetSingleTickerProviderStateMixin, Bootable {
  static DialogController get instance => Get.find<DialogController>();
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  final milliseconds = 200;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  Future<void> warning({required String message}) async =>
      await _showDialog(title: 'Dialog_Warning'.tr, message: message);

  Future<void> showError({required String message}) async =>
      await _showDialog(title: 'Dialog_Error'.tr, message: message);

  Future<void> showSuccess({required String message}) async =>
      await _showDialog(title: 'Dialog_Success'.tr, message: message);

  void _hide() {
    _animationController.reverse();
    Future.delayed(Duration(milliseconds: milliseconds), () {
      if (Get.isDialogOpen ?? false) Get.back();
    });
  }

  _showDialog({required String title, required String message}) async {
    _animationController.forward();
    await Get.dialog(
        AppDialog.warning(
            title: title,
            message: message,
            animation: _animation,
            rightBtnText: 'Dialog_OK'.tr,
            rightBtnOnPressed: () => _hide()),
        barrierDismissible: false);
  }

  Future<void> showCustomizedDialog({
    String? title,
    required String message,
    String? leftBtnText,
    String? rightBtnText,
    VoidCallback? leftBtnOnPressed,
    VoidCallback? rightBtnOnPressed,
  }) async {
    _animationController.forward();
    await Get.dialog(
      AppDialog(
          title: title ?? 'Dialog_Notification'.tr,
          message: message,
          animation: _animation,
          leftBtnText: leftBtnText,
          rightBtnText: rightBtnText,
          leftBtnOnPressed: leftBtnOnPressed,
          rightBtnOnPressed: () {
            rightBtnOnPressed?.call();
            _hide();
          }),
      barrierDismissible: false,
    );
  }
}
