part of 'core.dart';

abstract class BaseController extends GetxController {
  static BaseController get to => Get.find();
  late BuildContext context;
  Rx<bool> loading = false.obs;

}
