part of core_widget;

enum AppTextStyle {
  displayLarge(ThemeText.displayLarge),
  displayMedium(ThemeText.displayMedium),
  displaySmall(ThemeText.displaySmall),
  headlineLarge(ThemeText.headlineLarge),
  headlineMedium(ThemeText.headlineMedium),
  headlineSmall(ThemeText.headlineSmall),
  bodyLarge(ThemeText.bodyLarge),
  bodyMedium(ThemeText.bodyMedium),
  bodySmall(ThemeText.bodySmall);

  final TextStyle textStyle;
  const AppTextStyle(this.textStyle);
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle appTextStyle;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;

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
    TextStyle? textStyle =
        appTextStyle.textStyle.copyWith(color: textTheme.bodySmall!.color);
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        style: textStyle.copyWith(fontWeight: fontWeight, color: color));
  }
}
