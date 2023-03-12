import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';

class DemoController extends BaseController {
  Rx<int> counter = 0.obs;

  void increment() {
    counter.value = counter.value + 1;
  }

  void decrement() {
    int value = counter.value;
    if (value == 0) {
      return;
    }
    counter.value = --value;
  }

  void onPressedOnBoardScreen() {
    Get.toNamed(AppRouteProvider.onboardScreen);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
