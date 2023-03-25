part of 'routes.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case AppRouteProvider.splashScreen:
        Get.put(() {
          final localStorageController = Get.find<LocalStorageController>();
          return SplashController(localStorageController: localStorageController);
        });
        break;
      case AppRouteProvider.onboardScreen:
        Get.lazyPut(() => OnboardController());
        break;
      case AppRouteProvider.signupScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return SignUpController(authController: authController);
        });
        break;
      case AppRouteProvider.signinScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return SignInController(authController: authController);
        });
        break;
      case AppRouteProvider.signupProcessScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          final databaseController = Get.find<DatabaseController>();
          return SignUpProcessController(authController: authController, databaseController: databaseController);
        });
        break;
      case AppRouteProvider.paymentMethodScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return PaymentController(authController: authController);
        });
        break;
      case AppRouteProvider.uploadPhotoScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return UploadPhotoController(authController: authController);
        });
        break;
      case AppRouteProvider.uploadPreviewScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          final dbController = Get.find<DatabaseController>();
          final cloudStorageController = Get.find<CloudStorageController>();
          return UploadPreviewController(
              authController: authController,
              dbController: dbController,
              cloudStorageController: cloudStorageController);
        });
        break;
      case AppRouteProvider.setLocationScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          final dbController = Get.find<DatabaseController>();
          return SetLocationController(authController: authController, databaseController: dbController);
        });
        break;
      case AppRouteProvider.signupSuccessScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();

          return SignupSuccessController(authController: authController);
        });
        break;
      case AppRouteProvider.homeScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return HomeController(authController: authController);
        });
    }
  }
}
