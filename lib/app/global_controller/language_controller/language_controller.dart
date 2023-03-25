part of global_controller;

class TranslationController extends Translations {
  static late LocalStorageController localStorageController = Get.find();
  static var fallbackLocale = Locale('en', 'EN');

  static String localToString(Locale locale) {
    return locale.languageCode + "-" + locale.countryCode.toString();
  }

  static Locale localFromString(String text) {
    var code = text.split("-");
    return Locale(code.first, code.last);
  }

  static Future<Null> init(Locale locale) async {
    // String? lang = localStorageController.getString(LocalStorageKey.currentLanguage);
    // if (lang != null && lang.isNotEmpty)
    //   fallbackLocale = localFromString(lang);
    // else
    //   fallbackLocale = locale;
    // return null;
  }

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'vi': vi};

  static updateLocale(Locale locale) async {
    Get.updateLocale(locale);
    fallbackLocale = locale;
    localStorageController.writeString(
        LocalStorageKey.currentLanguage, localToString(locale));
  }
}
