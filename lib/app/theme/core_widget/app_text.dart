part of core_widget;

enum AppTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall;
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle? appTextStyle;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;

  // const AppText(
  //     {super.key,
  //     required this.text,
  //     this.appTextStyle,
  //     this.textAlign,
  //     this.fontWeight});
  const AppText.displayLarge(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.displayLarge,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.displayMedium(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.displayMedium,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.displaySmall(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.displaySmall,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.headlineLarge(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.headlineLarge,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.headlineMedium(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.headlineMedium,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.headlineSmall(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.headlineSmall,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.bodyLarge(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.bodyLarge,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.bodyMedium(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.bodyMedium,
      this.textAlign,
      this.fontWeight,
      this.color});
  const AppText.bodySmall(
      {super.key,
      required this.text,
      this.appTextStyle = AppTextStyle.bodySmall,
      this.textAlign,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    TextStyle? textStyle = textTheme.bodySmall;
    switch (appTextStyle) {
      case AppTextStyle.displayLarge:
        textStyle = textTheme.displayLarge;
        break;
      case AppTextStyle.displayMedium:
        textStyle = textTheme.displayMedium;
        break;
      case AppTextStyle.displaySmall:
        textStyle = textTheme.displaySmall;
        break;
      case AppTextStyle.headlineLarge:
        textStyle = textTheme.headlineLarge;
        break;
      case AppTextStyle.headlineMedium:
        textStyle = textTheme.headlineMedium;
        break;
      case AppTextStyle.headlineSmall:
        textStyle = textTheme.headlineSmall;
        break;
      case AppTextStyle.bodyLarge:
        textStyle = textTheme.bodyLarge;
        break;
      case AppTextStyle.bodyMedium:
        textStyle = textTheme.bodyMedium;
        break;
      case AppTextStyle.bodySmall:
        textStyle = textTheme.bodySmall;
        break;
      default:
    }

    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        style: textStyle!.copyWith(fontWeight: fontWeight, color: color));
  }
}
