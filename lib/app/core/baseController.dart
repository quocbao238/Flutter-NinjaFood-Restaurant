part of 'core.dart';

abstract class BaseController extends GetxController {
  static BaseController get to => Get.find();
  bool get initialized => super.initialized;
  late BuildContext context;
  Rx<bool> loading = false.obs;
}
