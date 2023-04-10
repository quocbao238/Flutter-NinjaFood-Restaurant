part of 'core.dart';

abstract class BaseController extends GetxController {
  static BaseController get to => Get.find();
  late BuildContext context;
  Rx<bool> loading = false.obs;

  @override
  void onInit() {
    loading.listen((p0) {
      if (p0) {
        Get.dialog(Center(child: AppLoading(isLoading: true)), barrierDismissible: false);
      } else {
        if (Get.isDialogOpen!) Get.back();
      }
    });
    super.onInit();
  }
}
