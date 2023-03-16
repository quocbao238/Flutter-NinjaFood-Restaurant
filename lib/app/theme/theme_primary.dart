part of 'theme.dart';

class ThemePrimary {
  static lightTheme() {
    return ThemeData(
        textTheme: GoogleFonts.beVietnamProTextTheme(
            ThemeText.appTextTheme(ThemeColors.textLightColor)),
        colorSchemeSeed: ThemeColors.primaryColor,
        brightness: Brightness.light,
        useMaterial3: true,
        // other
        elevatedButtonTheme: elevatedButtonTheme());
  }

  static darkTheme() {
    return ThemeData(
        textTheme: GoogleFonts.beVietnamProTextTheme(
            ThemeText.appTextTheme(ThemeColors.textDarkColor)),
        colorSchemeSeed: ThemeColors.primaryColor,
        brightness: Brightness.dark,
        useMaterial3: true,
        // other
        elevatedButtonTheme: elevatedButtonTheme());
  }

  static elevatedButtonTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            foregroundColor:
                ThemeColors.textDarkColor, // change background color of button
            textStyle:
                ThemeText.bodyLarge.copyWith(color: ThemeColors.textDarkColor)),
      );
}
