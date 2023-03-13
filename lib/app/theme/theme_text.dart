part of 'theme.dart';

class ThemeText {
  static TextStyle displayLarge(textColor) =>
      TextStyle(fontSize: 64.0, color: textColor);
  static TextStyle displayMedium(textColor) =>
      TextStyle(fontSize: 48.0, color: textColor);
  static TextStyle displaySmall(textColor) =>
      TextStyle(fontSize: 32.0, color: textColor);
  static TextStyle headlineLarge(textColor) =>
      TextStyle(fontSize: 28.0, color: textColor);
  static TextStyle headlineMedium(textColor) =>
      TextStyle(fontSize: 24.0, color: textColor);
  static TextStyle headlineSmall(textColor) =>
      TextStyle(fontSize: 22.0, color: textColor);
  static TextStyle bodyLarge(textColor) =>
      TextStyle(fontSize: 20.0, color: textColor);
  static TextStyle bodyMedium(textColor) =>
      TextStyle(fontSize: 18.0, color: textColor);
  static TextStyle bodySmall(textColor) =>
      TextStyle(fontSize: 16.0, color: textColor);

  static TextTheme appTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(fontSize: 64.0, color: textColor),
      displayMedium: TextStyle(fontSize: 48.0, color: textColor),
      displaySmall: TextStyle(fontSize: 32.0, color: textColor),
      headlineLarge: TextStyle(fontSize: 28.0, color: textColor),
      headlineMedium: TextStyle(fontSize: 24, color: textColor),
      headlineSmall: TextStyle(fontSize: 22, color: textColor),
      bodyLarge: TextStyle(fontSize: 20, color: textColor),
      bodyMedium: TextStyle(fontSize: 18, color: textColor),
      bodySmall: TextStyle(fontSize: 16, color: textColor),
    );
  }
}
