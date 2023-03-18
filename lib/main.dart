import 'package:flutter/material.dart';
import 'package:ninjafood/app/app.dart';
import 'package:ninjafood/app/routes/routes.dart';

import 'app/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  await AppPages.navigateDefaultPage();
  runApp(MyApp());
}
