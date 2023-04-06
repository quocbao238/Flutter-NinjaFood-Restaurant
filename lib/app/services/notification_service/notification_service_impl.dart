

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationServiceImpl {


  Future<RemoteMessage?> getInitialMessage();

  Future<String?> getFCMToken();

  Future<void> onRequestPermission();

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message);

  void handleMessage(RemoteMessage message);

}