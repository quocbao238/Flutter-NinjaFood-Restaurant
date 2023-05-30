part of 'routes.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case AppRouteProvider.splashScreen:
        Get.lazyPut(() => SplashController());
        break;
      case AppRouteProvider.onboardScreen:
        Get.lazyPut(() => OnboardController());
        break;
      case AppRouteProvider.signupScreen:
        Get.lazyPut(() => SignUpController());
        break;
      case AppRouteProvider.signInScreen:
        Get.lazyPut(() => SignInController());
        break;
      case AppRouteProvider.signupProcessScreen:
        Get.lazyPut(() => SignUpProcessController());
        break;
      case AppRouteProvider.tabScreen:
        Get.lazyPut(() => TabsController());
        Get.lazyPut(() => AdminTabsController());
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => GroupChatScreenController());
        break;
      case AppRouteProvider.forgotPasswordScreen:
        Get.lazyPut(() => ForgotPassWordController());
        break;
      case AppRouteProvider.categoryScreen:
        Get.lazyPut(() => CategoryScreenController());
        break;
      case AppRouteProvider.chatDetailsScreen:
        Get.lazyPut(() => RoomChatScreenController());
        break;
      case AppRouteProvider.foodDetailScreen:
        Get.lazyPut(() => ProductDetailScreenController());
        break;
      case AppRouteProvider.editProfileScreen:
        Get.lazyPut(() => EditProfileController());
        break;
      case AppRouteProvider.ratingScreen:
        Get.lazyPut(() => RatingScreenController());
        break;
      case AppRouteProvider.adminEditProductScreen:
        Get.lazyPut(() => AdminEditProductScreenController());
        break;
    }
  }
}
