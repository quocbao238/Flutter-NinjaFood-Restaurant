part of 'theme.dart';

class ThemeText {
  static TextTheme appTextTheme() {
    return TextTheme(
      displayLarge: TextStyle(fontSize: 64.0),
      displayMedium: TextStyle(fontSize: 48.0),
      displaySmall: TextStyle(fontSize: 32.0),
      headlineLarge: TextStyle(fontSize: 32.0),
      headlineMedium: TextStyle(fontSize: 24),
      headlineSmall: TextStyle(fontSize: 22),
      bodyLarge: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 18),
      bodySmall: TextStyle(fontSize: 16),
    );
  }
}
