import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjafood/app/app.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'app/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await initService();
  await AppPages.navigateDefaultPage();

  runApp(MyApp());
}
