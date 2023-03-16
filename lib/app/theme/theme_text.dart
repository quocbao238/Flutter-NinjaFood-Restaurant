part of 'theme.dart';

class ThemeText {
  static const TextStyle displayLarge = TextStyle(fontSize: 64.0);
  static const TextStyle displayMedium = TextStyle(fontSize: 48.0);
  static const TextStyle displaySmall = TextStyle(fontSize: 32.0);
  static const TextStyle headlineLarge = TextStyle(fontSize: 24.0);
  static const TextStyle headlineMedium = TextStyle(fontSize: 20.0);
  static const TextStyle headlineSmall = TextStyle(fontSize: 18.0);
  static const TextStyle bodyLarge = TextStyle(fontSize: 16.0);
  static const TextStyle bodyMedium = TextStyle(fontSize: 14.0);
  static const TextStyle bodySmall = TextStyle(fontSize: 12.0);

  static TextTheme appTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: textColor),
      displayMedium: displayMedium.copyWith(color: textColor),
      displaySmall: displaySmall.copyWith(color: textColor),
      headlineLarge: headlineLarge.copyWith(color: textColor),
      headlineMedium: headlineMedium.copyWith(color: textColor),
      headlineSmall: headlineSmall.copyWith(color: textColor),
      bodyLarge: bodyLarge.copyWith(color: textColor),
      bodyMedium: bodyMedium.copyWith(color: textColor),
      bodySmall: bodySmall.copyWith(color: textColor),
    );
  }
}
