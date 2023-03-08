import 'package:ninjafood/config/router.dart';
import 'package:ninjafood/config/theme.dart';
import 'package:ninjafood/flavors.dart';
import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

/// Main example app class
class MyApp extends StatelessWidget {
  /// Default constructor for Example app
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,  
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
