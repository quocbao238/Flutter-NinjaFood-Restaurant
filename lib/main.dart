import 'package:flutter/material.dart';
import 'package:ninjafood/app/app.dart';
import 'package:ninjafood/app/routes/routes.dart';

import 'app/services/lang/translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.init(Locale('vi', 'VN'));
  await AppPages.navigateDefaultPage();
  runApp(MyApp());
}
