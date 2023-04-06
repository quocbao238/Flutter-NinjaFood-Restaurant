import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/globalController/userController.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class PaymentController extends BaseController {
  final _userController = UserController.instance;
  final _databaseService = DatabaseService.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressBack() {
    Get.back();
  }

  void onPressedPayPal() {}

  void onPressedVisa() {}

  void onPressedPayoneer() {}

  void onPressedNext() {
    final currentUser = _userController.getCurrentUser;
    if (currentUser?.photoUrl?.isNotEmpty ?? false) {
       Get.toNamed(AppRouteProvider.setLocationScreen);
       return;
    }
    Get.toNamed(AppRouteProvider.uploadPhotoScreen);
  }
}
