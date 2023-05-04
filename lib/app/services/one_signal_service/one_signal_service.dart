import 'package:get/get.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

const _logName = 'OneSignalService';

class OneSignalService extends GetxService implements Bootable {
  static OneSignalService get instance => Get.find<OneSignalService>();

  late ConsoleService log = ConsoleService.instance;
  final String oneSignalAppId = 'bb9d8495-95e5-4bf9-a117-73722dd9413c';
  final oneSignal = OneSignal.shared;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    await _initService();
  }

  // Remove player id
  Future<void> removePlayerId(String uid) async {
    await OneSignal.shared.removeExternalUserId();
    log.show(_logName, 'removePlayerId $uid');
  }

  Future<String?> setPlayerId(String uid) async {
    await OneSignal.shared.setExternalUserId(uid);
    log.show(_logName, 'setPlayerId $uid');
    return await _getPlayerId();
  }

  Future<String?> _getPlayerId() async {
    var deviceState = await OneSignal.shared.getDeviceState();
    if (deviceState == null || deviceState.userId == null) return null;
    log.show(_logName, 'getPlayerId ${deviceState.userId}');
    return deviceState.userId;
  }

  _initService() async {
    // Debug
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId(oneSignalAppId);
    await OneSignal.shared.consentGranted(true);

    OneSignal.shared.promptUserForPushNotificationPermission();

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      log.show(_logName, 'NOTIFICATION OPENED HANDLER CALLED WITH: $result');
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      log.show(_logName, 'FOREGROUND HANDLER CALLED WITH: $event');
      event.complete(null);
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      log.show(_logName,
          'In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}');
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      log.show(_logName,
          'SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      log.show(_logName,
          'PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      log.show(_logName,
          'EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}');
    });

    OneSignal.shared
        .setSMSSubscriptionObserver((OSSMSSubscriptionStateChanges changes) {
      log.show(_logName,
          'SMS SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setOnWillDisplayInAppMessageHandler((message) {
      print("ON WILL DISPLAY IN APP MESSAGE ${message.messageId}");
      log.show(_logName, 'ON WILL DISPLAY IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setOnDidDisplayInAppMessageHandler((message) {
      print("ON DID DISPLAY IN APP MESSAGE ${message.messageId}");
      log.show(_logName, 'ON DID DISPLAY IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setOnWillDismissInAppMessageHandler((message) {
      print("ON WILL DISMISS IN APP MESSAGE ${message.messageId}");
      log.show(_logName, 'ON WILL DISMISS IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setOnDidDismissInAppMessageHandler((message) {
      print("ON DID DISMISS IN APP MESSAGE ${message.messageId}");
      log.show(_logName, 'ON DID DISMISS IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setLaunchURLsInApp(false);

    await OneSignal.shared.requiresUserPrivacyConsent();

    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    log.show(
        _logName, 'USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent');
  }

  Future<void> sendNotification(OSCreateNotification notification) async {
    try {
      var response = await OneSignal.shared.postNotification(notification);

      print(response.toString());
    } catch (e) {
      log.show(_logName, 'NOTIFICATION OPENED HANDLER ERROR: $e');
    }
  }
}
