part of core_widget;

enum AppButtonType {
  min(0.4),
  max(0.85);
  final double ratio;
  const AppButtonType(this.ratio);
}

class AppButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final String title;
  final AppButtonType buttonType;

  const AppButton.min(
      {super.key,
      required this.title,
      this.padding,
      this.margin,
      this.onPressed,
      this.buttonType = AppButtonType.min});
  const AppButton.max(
      {super.key,
      required this.title,
      this.padding,
      this.margin,
      this.onPressed,
      this.buttonType = AppButtonType.max});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * buttonType.ratio;

    return Container(
      width: width,
      height: kToolbarHeight,
      margin: margin,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: ThemeColors.gradientButtonColor,
            borderRadius: BorderRadius.circular(16)),
        child: ElevatedButton(
          onPressed: onPressed,
          child: FittedBox(child: Text(title)),
        ),
      ),
    );
  }
}
