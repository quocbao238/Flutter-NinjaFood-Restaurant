import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseMessageController extends GetxService {


  late final FirebaseMessaging _firebaseMessaging;
  FirebaseMessaging get _delegate => _firebaseMessaging;


  // Init methods
  Future<void> call() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    await _onRequestPermission();
    // Listen for when the app is in the foreground
    FirebaseMessaging.onMessage.listen(_handleMessage);
    // Listen for when the app has been closed completely and is opened from the notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    // Listen for when the app is in the background and terminated
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  }

  Future<RemoteMessage?> getInitialMessage() {
    return _delegate.getInitialMessage();
  }


  // Public methods
  Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();

  }

  void showNotification(RemoteMessage message) {

  }

  // Private methods
  // When the app is in the background or terminated, you can still receive data messages.
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }

  // Handle message when app is in foreground
  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {

    }

  }


  Future<void> _onRequestPermission() async {
   await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );
  }
}