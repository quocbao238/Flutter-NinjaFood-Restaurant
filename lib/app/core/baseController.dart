part of 'core.dart';

abstract class BaseController extends GetxController {
  static BaseController get to => Get.find();
  late BuildContext context;
  var loading = false.obs;
  var loadingMore = false.obs;
}
