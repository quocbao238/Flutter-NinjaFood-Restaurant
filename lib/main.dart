import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjafood/app/app.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'app/global_controller/global_controller.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // }


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    await initGlobalController();
    await AppPages.navigateDefaultPage();
    runApp(MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
