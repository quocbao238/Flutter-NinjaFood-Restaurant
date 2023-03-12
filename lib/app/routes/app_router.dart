part of 'routes.dart';

class AppPages {
  static String initial = AppRouteProvider.demoScreen;

  static navigateDefaultPage() async {}

  //
  static final routes = [
    GetPage(
      name: AppRouteProvider.demoScreen,
      page: () => DemoScreen(),
      binding: GetBinding(AppRouteProvider.demoScreen),
    ),
    GetPage(
      name: AppRouteProvider.onboardScreen,
      page: () => OnboardScreen(),
      binding: GetBinding(AppRouteProvider.onboardScreen),
    ),
  ];
}
