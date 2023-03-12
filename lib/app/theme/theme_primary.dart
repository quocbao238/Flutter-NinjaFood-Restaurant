part of 'theme.dart';

class ThemePrimary {
  static theme() {
    return ThemeData(
      textTheme: GoogleFonts.interTextTheme(),
      colorSchemeSeed: ThemeColors.primaryColor,
      brightness: Brightness.light,
      primaryTextTheme: ThemeText.appTextTheme(),
      useMaterial3: true,

      // other
      textButtonTheme: TextButtonThemeData(style: ButtonStyle()),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle()),
    );
  }
}
