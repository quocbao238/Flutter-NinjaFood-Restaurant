import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'setLocationController';

class SignUpLocationController extends BaseController {
  final databaseService = DatabaseService.instance;
  final userController = UserController.instance;

  Rxn<String?> addressLocation = Rxn<String?>(null);

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

  void onPressedSetLocation() {
    addressLocation.value = '208 Nguyen Huu Canh, Vinhomes Tan Cang, Binh Thanh, Ho Chi Minh City 700000, Vietnam';
  }

  Future<void> onPressedNextSkipButton() async {
    if (addressLocation.value == null) {
      Get.offNamed(AppRouteProvider.signupSuccessScreen);
      return;
    }
    loading(true);
    final response = await userController.updateUser(address: addressLocation.value);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
      Get.toNamed(AppRouteProvider.signupSuccessScreen);
    });
    loading(false);
  }

  String getTitleButton() {
    return addressLocation.value == null ? 'Skip_Button' : 'Next_Button';
  }
}
