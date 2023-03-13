part of 'theme.dart';

class ThemePrimary {
  
  static lightTheme() {
    return ThemeData(
      textTheme: GoogleFonts.interTextTheme(
          ThemeText.appTextTheme(ThemeColors.textLightColor)),
      colorSchemeSeed: ThemeColors.primaryColor,
      brightness: Brightness.light,
      useMaterial3: true,
      // other
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            surfaceTintColor: Colors.transparent,
            foregroundColor:
                ThemeColors.textDarkColor, // change background color of button
            textStyle: ThemeText.bodyLarge(ThemeColors.textDarkColor)),
      ),
    );
  }

  static darkTheme() {
    return ThemeData(
      textTheme: GoogleFonts.interTextTheme(
          ThemeText.appTextTheme(ThemeColors.textDarkColor)),
      colorSchemeSeed: ThemeColors.primaryColor,
      brightness: Brightness.dark,
      useMaterial3: true,
      // other
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            foregroundColor:
                ThemeColors.textDarkColor, // change background color of button
            textStyle: ThemeText.bodyLarge(ThemeColors.textDarkColor)),
      ),
    );
  }
}
