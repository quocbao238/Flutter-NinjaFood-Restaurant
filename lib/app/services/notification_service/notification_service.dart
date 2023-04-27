import 'package:firebase_messaging/firebase_messaging.dart';
part 'notification_service_impl.dart';

// class NotificationService extends GetxService implements Bootable, NotificationServiceImpl {
//   static NotificationService get instance => Get.find<NotificationService>();
//   late final FirebaseMessaging _firebaseMessaging;
//
//   @override
//   Future<void> call() async {
//     Get.put(this, permanent: true);
//     _firebaseMessaging = FirebaseMessaging.instance;
//     await onRequestPermission();
//     // Listen for when the app is in the foreground
//     // FirebaseMessaging.onMessage.listen(handleMessage);
//     // // Listen for when the app has been closed completely and is opened from the notification
//     // FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     // // Listen for when the app is in the background and terminated
//     // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }
//
//   @override
//   Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print("Handling a background message: $message");
//   }
//
//   @override
//   Future<String?> getFCMToken() async {
//     return await _firebaseMessaging.getToken();
//   }
//
//   @override
//   Future<RemoteMessage?> getInitialMessage() {
//     // TODO: implement getInitialMessage
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> onRequestPermission() async {
//     await _firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true);
//   }
//
//   @override
//   void handleMessage(RemoteMessage message) {}
// }
