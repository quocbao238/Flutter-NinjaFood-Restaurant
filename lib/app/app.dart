import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/services/language_service/language_service.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
          title: "NinjaFood",
          theme: ThemePrimary.lightTheme(),
          darkTheme: ThemePrimary.darkTheme(),
          onInit: () async => DeviceHelper.init(),
          debugShowCheckedModeBanner: false,
          enableLog: true,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: TranslationService.fallbackLocale,
          fallbackLocale: TranslationService.fallbackLocale,
          builder: (context, child) {
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child!);
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          translations: TranslationService()),
    );
  }
}
