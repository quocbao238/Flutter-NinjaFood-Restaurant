import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'setLocationController';

class SetLocationController extends BaseController {
  // final AuthController authController;
  // final DatabaseController databaseController;

  // SetLocationController({required this.authController, required this.databaseController});

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

    // final user = authController.currentUser;
    // if (user == null) return;
    //
    // loading(true);
    // final newUserData = user.copyWith(address: addressLocation.value);
    // final response = await databaseController.updateUser(newUserData);
    // await response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
    //   Get.toNamed(AppRouteProvider.signupSuccessScreen);
    // });
    // loading(false);
  }

  String getTitleButton() {
    return addressLocation.value == null ? 'Skip_Button' : 'Next_Button';
  }
}
