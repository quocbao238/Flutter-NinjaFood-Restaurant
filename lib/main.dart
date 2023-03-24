import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjafood/app/app.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'app/global_controller/global_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await initGlobalController();
  await AppPages.navigateDefaultPage();

  runApp(MyApp());
}
