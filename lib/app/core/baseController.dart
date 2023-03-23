part of 'core.dart';

abstract class BaseController extends GetxController {
  static BaseController get to => Get.find();
  late BuildContext context;
  Rx<bool> loading = false.obs;
  late final StreamSubscription<bool> _streamLoadingSubscription;

  @override
  void onInit() {
    super.onInit();
    _streamLoadingSubscription =  loading.listen((bool _value) {
      if (_value) {
        Get.dialog(Center(child: AppLoading(isLoading: true)), barrierDismissible: false);
        return;
      }
      Get.back();
    });
  }

  @override
  void dispose() {
    _streamLoadingSubscription.cancel();
    super.dispose();
  }
}
