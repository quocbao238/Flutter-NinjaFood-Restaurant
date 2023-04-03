part of 'routes.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case AppRouteProvider.splashScreen:
        final localStorageController = Get.find<LocalStorageController>();
        Get.lazyPut(() =>
            SplashController(localStorageController: localStorageController));
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
          return SignUpProcessController(
              authController: authController,
              databaseController: databaseController);
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
          return SetLocationController(
              authController: authController, databaseController: dbController);
        });
        break;
      case AppRouteProvider.signupSuccessScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();

          return SignupSuccessController(authController: authController);
        });
        break;
      case AppRouteProvider.tabScreen:
        final themeController = Get.find<ThemeController>();
        final authController = Get.find<AuthController>();
        final databaseController = Get.find<DatabaseController>();
        Get.lazyPut(() => TabsController(
            authController: authController, themeController: themeController));
        Get.lazyPut(() => HomeController(
            authController: authController,
            databaseController: databaseController));
        final tabsController = Get.find<TabsController>();
        Get.lazyPut(() => ChatScreenController(
            tabsController: tabsController));
        break;
      case AppRouteProvider.forgotPasswordScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return ForgotPassWordController(authController: authController);
        });
        break;
      case AppRouteProvider.successNotificationScreen:
        Get.lazyPut(() {
          final authController = Get.find<AuthController>();
          return SuccessNotificationController(authController: authController);
        });
        break;
      case AppRouteProvider.menuScreen:
        Get.lazyPut(() {
          final homeController = Get.find<HomeController>();
          return MenuScreenController(homeController: homeController);
        });
        break;
    }
  }
}
