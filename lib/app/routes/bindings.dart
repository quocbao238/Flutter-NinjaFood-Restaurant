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
      case AppRouteProvider.signinScreen:
        Get.lazyPut(() => SignInController());
        break;
      case AppRouteProvider.signupProcessScreen:
        Get.lazyPut(() => SignUpProcessController());
        break;
      case AppRouteProvider.paymentMethodScreen:
        Get.lazyPut(() => PaymentController());
        break;
      case AppRouteProvider.uploadPhotoScreen:
        Get.lazyPut(() => UploadPhotoController());
        break;
      case AppRouteProvider.uploadPreviewScreen:
        Get.lazyPut(() => UploadPreviewController());
        break;
      case AppRouteProvider.setLocationScreen:
        Get.lazyPut(() => SignUpLocationController());
        break;
      case AppRouteProvider.signupSuccessScreen:
        Get.lazyPut(() => SignupSuccessController());
        break;
      case AppRouteProvider.tabScreen:
        Get.lazyPut(() => TabsController());
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => GroupChatScreenController());
        Get.lazyPut(() => CartScreenController());
        break;
      case AppRouteProvider.forgotPasswordScreen:
        Get.lazyPut(() => ForgotPassWordController());
        break;
      case AppRouteProvider.successNotificationScreen:
        Get.lazyPut(() => ResetPasswordController());
        break;
      case AppRouteProvider.menuScreen:
        Get.lazyPut(() => MenuScreenController());
        break;
      case AppRouteProvider.chatDetailsScreen:
        Get.lazyPut(() => RoomChatScreenController());
        break;
      case AppRouteProvider.foodDetailScreen:
        Get.lazyPut(() => FoodDetailController());
        break;
    }
  }
}
