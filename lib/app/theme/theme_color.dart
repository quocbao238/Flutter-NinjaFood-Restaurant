part of 'theme.dart';

class ThemeColors {
  ///Colors
  static const primaryColor = Color(0xFF53E88B);
  static const backgroundColor = Color(0xFFFEFEFF);
  static const backgroundDarkColor = Color(0xFF0D0D0D);

  static const textLightColor = Color(0xFF09051C);
  static const textDarkColor = Color(0xFFFFFFFF);

  static const textSubColor = Color(0xFF3B3B3B);

  static const hintColorLight = Color(0xFF3B3B3B);
  static const hintColorDark = Color(0xFFFFFFFF);

  static backgroundTextFormDark() => backgroundColor.withOpacity(0.1);
  static const backgroundTextFormLight = Color(0xFFFFFFFF);

  static const borderColorLight = Color(0xFFF4F4F4);
  static const borderColorDark = Colors.transparent;

  // static const shadowLightColor = Color(0xFF5A6CEA);
  static shadowLightColor() => Color(0xFF5A6CEA).withOpacity(0.07);

  static const gradientButtonColor = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFF53E88B), Color(0xFF15BE77)]);
}
