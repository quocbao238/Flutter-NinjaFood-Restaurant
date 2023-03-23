part of 'routes.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case AppRouteProvider.splashScreen:
        Get.put(() => SplashController(
            sharedPreferencesService: Get.find<SharedPreferencesService>()));
        break;
      case AppRouteProvider.onboardScreen:
        Get.lazyPut(() => OnboardController());
        break;
      case AppRouteProvider.signupScreen:
        Get.lazyPut(
            () => SignUpController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.signinScreen:
        Get.lazyPut(
            () => SignInController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.signupProcessScreen:
        Get.lazyPut(() =>
            SignUpProcessController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.paymentMethodScreen:
        Get.lazyPut(
            () => PaymentController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.uploadPhotoScreen:
        Get.lazyPut(() =>
            UploadPhotoController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.uploadPreviewScreen:
        Get.lazyPut(() =>
            UploadPreviewController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.setLocationScreen:
        Get.lazyPut(() =>
            SetLocationController(authProvider: Get.find<AuthProvider>()));
        break;
      case AppRouteProvider.homeScreen:
        Get.lazyPut(() => HomeController(authProvider: Get.find<AuthProvider>()));
    }
  }
}

