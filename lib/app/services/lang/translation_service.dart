import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'vi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'en.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class TranslationService extends Translations {
  // static final locale = Get.deviceLocale;
  static var fallbackLocale = Locale('vi', 'VN');

  static String localToString(Locale locale) {
    return locale.languageCode + "-" + locale.countryCode.toString();
  }

  static Locale localFromString(String text) {
    var code = text.split("-");
    return Locale(code.first, code.last);
  }

  static Future<Null> init(Locale locale) async {
    final SharedPreferences prefs = await _prefs;
    String? lang = prefs.getString('lang');
    if (lang != null && lang.isNotEmpty)
      fallbackLocale = localFromString(lang);
    else
      fallbackLocale = locale;
    return null;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'vi': vi,
      };

  static updateLocale(Locale locale) async {
    final SharedPreferences prefs = await _prefs;
    Get.updateLocale(locale);
    fallbackLocale = locale;
    prefs.setString('lang', localToString(locale));
  }
}
