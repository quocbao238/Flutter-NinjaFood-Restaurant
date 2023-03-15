part of 'routes.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case AppRouteProvider.demoScreen:
        Get.lazyPut(() => DemoController());
        break;
      case AppRouteProvider.onboardScreen:
        Get.lazyPut(() => OnboardController());
        break;
      case AppRouteProvider.signupScreen:
        Get.lazyPut(() => OnboardController());
        break;
    }
  }
}


// Tao screen (presentation)
// Tao controller (controllers)
// App_Provider tao routeName
// Binding -> Map App_Provider vs Controller
// app_router -> 