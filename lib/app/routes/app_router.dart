part of 'routes.dart';

class AppPages {
  static String initial = AppRouteProvider.splashScreen;

  static navigateDefaultPage() async {
    final userController = UserController.instance;
    if (userController.getFirebaseAuthUser != null) {
      initial = AppRouteProvider.tabScreen;
      return;
    }

    initial = AppRouteProvider.splashScreen;
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
      name: AppRouteProvider.signInScreen,
      page: () => SignInScreen(),
      binding: GetBinding(AppRouteProvider.signInScreen),
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
    GetPage(
      name: AppRouteProvider.paymentMethodScreen,
      page: () => SignUpPaymentScreen(),
      binding: GetBinding(AppRouteProvider.paymentMethodScreen),
    ),
    GetPage(
      name: AppRouteProvider.uploadPhotoScreen,
      page: () => SignUpUploadPhotoScreen(),
      binding: GetBinding(AppRouteProvider.uploadPhotoScreen),
    ),
    GetPage(
      name: AppRouteProvider.uploadPreviewScreen,
      page: () => SignUpPhotoPreviewScreen(),
      binding: GetBinding(AppRouteProvider.uploadPreviewScreen),
    ),
    GetPage(
      name: AppRouteProvider.setLocationScreen,
      page: () => SetLocationScreen(),
      binding: GetBinding(AppRouteProvider.setLocationScreen),
    ),
    GetPage(
      name: AppRouteProvider.signupSuccessScreen,
      page: () => SignupSuccessScreen(),
      binding: GetBinding(AppRouteProvider.signupSuccessScreen),
    ),
    GetPage(
      name: AppRouteProvider.tabScreen,
      page: () => TabScreen(),
      binding: GetBinding(AppRouteProvider.tabScreen),
    ),
    GetPage(
      name: AppRouteProvider.forgotPasswordScreen,
      page: () => ResetPasswordScreen(),
      binding: GetBinding(AppRouteProvider.forgotPasswordScreen),
    ),
    GetPage(
      name: AppRouteProvider.successNotificationScreen,
      page: () => SuccessNotificationScreen(),
      binding: GetBinding(AppRouteProvider.successNotificationScreen),
    ),
    GetPage(
      name: AppRouteProvider.categoryScreen,
      page: () => CategoryScreen(),
      binding: GetBinding(AppRouteProvider.categoryScreen),
    ),
    GetPage(
      name: AppRouteProvider.chatDetailsScreen,
      page: () => ChatDetailsScreen(),
      binding: GetBinding(AppRouteProvider.chatDetailsScreen),
    ),
    GetPage(
      name: AppRouteProvider.foodDetailScreen,
      page: () => ProductDetailScreen(),
      binding: GetBinding(AppRouteProvider.foodDetailScreen),
    ),
    GetPage(
      name: AppRouteProvider.imagePreviewScreen,
      page: () => ImagePreviewScreen(url: Get.arguments),
    ),
    GetPage(
      name: AppRouteProvider.promotionDetailScreen,
      page: () => PromotionDetailScreen(promotionModel: Get.arguments),
    ),
    GetPage(
      name: AppRouteProvider.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: GetBinding(AppRouteProvider.editProfileScreen),
    ),
    GetPage(
      name: AppRouteProvider.notificationScreen,
      page: () => NotificationScreen(),
      binding: GetBinding(AppRouteProvider.notificationScreen),
    ),
    GetPage(
      name: AppRouteProvider.ratingScreen,
      page: () => RatingScreen(),
      binding: GetBinding(AppRouteProvider.ratingScreen),
    ),
    GetPage(
      name: AppRouteProvider.orderDetailScreen,
      page: () => OrderDetailsScreen(orderModel: Get.arguments),
      binding: GetBinding(AppRouteProvider.orderDetailScreen),
    ),
    GetPage(
      name: AppRouteProvider.locationPickerScreen,
      page: () => LocationPickerScreen(),
      binding: GetBinding(AppRouteProvider.locationPickerScreen),
    ),
    GetPage(
      name: AppRouteProvider.adminEditProductScreen,
      page: () => AdminEditProductScreen(),
      binding: GetBinding(AppRouteProvider.adminEditProductScreen),
    ),
    GetPage(
      name: AppRouteProvider.adminCategoryScreen,
      page: () => AdminCategoryScreen(),
      binding: GetBinding(AppRouteProvider.adminCategoryScreen),
    ),
  ];
}
