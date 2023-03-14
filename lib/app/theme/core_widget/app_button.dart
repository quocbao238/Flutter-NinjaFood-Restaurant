part of core_widget;

enum AppButtonType { min, max }

class AppButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final String title;
  final AppButtonType? buttonType;

  const AppButton(
      {super.key,
      required this.title,
      this.padding,
      this.margin,
      this.onPressed,
      this.buttonType = AppButtonType.min});

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
    double width = MediaQuery.of(context).size.width;

    switch (buttonType) {
      case AppButtonType.min:
        width = width * 0.4;
        break;
      case AppButtonType.max:
        width = width * 0.85;
        break;
      default:
    }

    return Container(
      width: width,
      height: kToolbarHeight,
      margin: margin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF53E88B),
            Color(0xFF15BE77)
            //add more colors
          ]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: FittedBox(child: Text(title)),
        ),
      ),
    );
  }
}
