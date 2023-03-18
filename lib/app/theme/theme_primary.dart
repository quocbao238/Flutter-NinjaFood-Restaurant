part of 'theme.dart';

class ThemePrimary {
  static lightTheme() {
    return ThemeData(
        textTheme: GoogleFonts.beVietnamProTextTheme(
            ThemeText.appTextTheme(ThemeColors.textLightColor)),
        colorScheme: ColorScheme.light().copyWith(
          primary: ThemeColors.primaryColor,
          background: ThemeColors.backgroundColor,
        ),
        brightness: Brightness.light,
        useMaterial3: true,
        // other
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeColors.borderColorLight),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeColors.borderColorLight),
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: ThemeColors.backgroundTextFormLight,
            hintStyle: ThemeText.bodyMedium
                .copyWith(color: ThemeColors.hintColorLight)),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: elevatedButtonStyle()!));
  }

  static darkTheme() {
    return ThemeData(
        textTheme: GoogleFonts.beVietnamProTextTheme(
            ThemeText.appTextTheme(ThemeColors.textDarkColor)),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark().copyWith(
            primary: ThemeColors.primaryColor,
            background: ThemeColors.backgroundDarkColor),
        useMaterial3: true,
        // other
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeColors.borderColorDark),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeColors.borderColorDark),
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: ThemeColors.backgroundTextFormDark(),
            hintStyle: ThemeText.bodyMedium
                .copyWith(color: ThemeColors.hintColorDark)),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: elevatedButtonStyle()));
  }

  static elevatedButtonStyle() => ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      foregroundColor:
          ThemeColors.textDarkColor, // change background color of button
      textStyle:
          ThemeText.bodyLarge.copyWith(color: ThemeColors.textDarkColor));
}
