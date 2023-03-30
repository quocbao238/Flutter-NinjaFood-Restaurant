import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/features/role_user/home/infrastructure/models/popular_food_model.dart';
import 'package:ninjafood/app/features/role_user/home/infrastructure/models/popular_menu_model.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

const _logName = 'HomeController';

enum HomeViewType { normal, popularMenu, popularFood }

class HomeController extends GetxController {
  final AuthController authController;

  HomeController({required this.authController});

  List<PopularMenuItem> popularMenu  = PopularMenuItem.popularMenuList;

  List<PopularFoodItem> popularFood = PopularFoodItem.popularFoodList;

  Rx<HomeViewType> homeViewType = HomeViewType.normal.obs;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onPressedLogout() async {
    final response = await authController.signOut();
    response.fold(
        (l) => handleFailure(_logName, l, showDialog: true), (r) => Get.offAllNamed(AppRouteProvider.signinScreen));
  }

  void onPressedVerifyEmail() async {
    final response = await authController.sendEmailVerification();
    response.fold(
        (l) => handleFailure(_logName, l, showDialog: true), (r) => Get.snackbar('Success', 'Email verification sent'));
  }

  void onPressedViewMorePopularMenu() {
    homeViewType.value = HomeViewType.popularMenu;
  }

  void onPressedViewMorePopularFood() {
    homeViewType.value = HomeViewType.popularFood;
  }

}
