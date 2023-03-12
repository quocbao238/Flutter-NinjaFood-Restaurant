part of 'theme.dart';

class ThemePrimary {
  ///Colors
  static const primaryColor = Color(0xff3C6100);
  static const textPrimaryColor = Color(0xFF4a4848);
  static const textSubColor = Color(0xFFA3A3A3);

  static theme() {
    return ThemeData(
      textTheme: GoogleFonts.interTextTheme(),
      primaryColor: primaryColor,
      snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor, actionTextColor: Colors.white),
      dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          contentTextStyle: TextStyle(color: primaryColor)),
      buttonTheme: ButtonThemeData(buttonColor: primaryColor),
    );
  }
}
