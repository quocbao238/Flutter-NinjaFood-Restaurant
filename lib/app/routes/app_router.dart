part of 'routes.dart';

class AppPages {
  static String initial = AppRouteProvider.splashScreen;

  static navigateDefaultPage() async {
    final authProvider = Get.find<AuthProvider>();
    if (authProvider.currnetAccount.value != null) {
      initial = AppRouteProvider.signinScreen;
    }
  }

  //
  static final routes = [
    GetPage(
      name: AppRouteProvider.splashScreen,
      page: () => SplashScreen(),
      binding: GetBinding(AppRouteProvider.splashScreen),
    ),
    GetPage(
      name: AppRouteProvider.onboardScreen,
      page: () => OnboardScreen(),
      binding: GetBinding(AppRouteProvider.onboardScreen),
    ),
    GetPage(
      name: AppRouteProvider.signinScreen,
      page: () => SignInScreen(),
      binding: GetBinding(AppRouteProvider.signinScreen),
    ),
    GetPage(
      name: AppRouteProvider.signupScreen,
      page: () => SignUpScreen(),
      binding: GetBinding(AppRouteProvider.signupScreen),
    ),
    GetPage(
      name: AppRouteProvider.signupProcessScreen,
      page: () => SignUpProcessScreen(),
      binding: GetBinding(AppRouteProvider.signupProcessScreen),
    ),
  ];
}
