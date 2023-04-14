library contains;
import 'package:get/get.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
part 'failure.dart';


class LocalStorageKey{
  static const currentLanguage = 'current_language';
  static const isDarkThemeKey = 'theme_keys';
  static const secondTimeOpenApp = 'first_time_open_app_key';
}


class UserCreateType{
  static const email = 'email';
  static const google = 'google';
  static const facebook = 'facebook';
}