import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/services/services.dart';
import 'package:ninjafood/app/theme/theme.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "NinjaFood",
        theme: ThemePrimary.lightTheme(),
        darkTheme: ThemePrimary.darkTheme(),
        onReady: () {},
        onInit: () async {
          // initService();
          DeviceHelper.init();
        },
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        locale: TranslationService.fallbackLocale,
        fallbackLocale: TranslationService.fallbackLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        translations: TranslationService());
  }
}
