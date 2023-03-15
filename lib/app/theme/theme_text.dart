part of 'theme.dart';

class ThemeText {
  static TextStyle displayLarge(Color? textColor) =>
      TextStyle(fontSize: 64.0, color: textColor);
  static TextStyle displayMedium(textColor) =>
      TextStyle(fontSize: 48.0, color: textColor);
  static TextStyle displaySmall(textColor) =>
      TextStyle(fontSize: 32.0, color: textColor);
  static TextStyle headlineLarge(textColor) =>
      TextStyle(fontSize: 24.0, color: textColor);
  static TextStyle headlineMedium(textColor) =>
      TextStyle(fontSize: 20.0, color: textColor);
  static TextStyle headlineSmall(textColor) =>
      TextStyle(fontSize: 18.0, color: textColor);
  static TextStyle bodyLarge(textColor) =>
      TextStyle(fontSize: 16.0, color: textColor);
  static TextStyle bodyMedium(textColor) =>
      TextStyle(fontSize: 14.0, color: textColor);
  static TextStyle bodySmall(textColor) =>
      TextStyle(fontSize: 12.0, color: textColor);

  static TextTheme appTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: displayLarge(textColor),
      displayMedium: displayMedium(textColor),
      displaySmall: displaySmall(textColor),
      headlineLarge: headlineLarge(textColor),
      headlineMedium: headlineMedium(textColor),
      headlineSmall: headlineSmall(textColor),
      bodyLarge: bodyLarge(textColor),
      bodyMedium: bodyMedium(textColor),
      bodySmall: bodySmall(textColor),
    );
  }
}
