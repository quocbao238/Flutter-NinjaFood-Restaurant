import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/global_controller/lang/en.dart';
import 'package:ninjafood/app/global_controller/lang/vi.dart';
import '../services.dart';

class TranslationService extends Translations {
  static late SharedPreferencesService prefsService = Get.find();
  static var fallbackLocale = Locale('en', 'EN');

  static String localToString(Locale locale) {
    return locale.languageCode + "-" + locale.countryCode.toString();
  }

  static Locale localFromString(String text) {
    var code = text.split("-");
    return Locale(code.first, code.last);
  }

  static Future<Null> init(Locale locale) async {
    String? lang = prefsService.getString(SharedPreferencesKey.currentLanguage);
    if (lang != null && lang.isNotEmpty)
      fallbackLocale = localFromString(lang);
    else
      fallbackLocale = locale;
    return null;
  }

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'vi': vi};

  static updateLocale(Locale locale) async {
    Get.updateLocale(locale);
    fallbackLocale = locale;
    prefsService.writeString(
        SharedPreferencesKey.currentLanguage, localToString(locale));
  }
}
