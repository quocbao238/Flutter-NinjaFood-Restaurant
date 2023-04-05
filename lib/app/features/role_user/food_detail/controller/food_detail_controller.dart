import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class FoodDetailController extends BaseController {
  final TabsController tabsController;

  FoodDetailController({required this.tabsController});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedback() {
    Get.back();
  }
}
