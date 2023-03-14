part of core_widget;

class AppSizeScale extends StatelessWidget {
  final double? ratioWidth;
  final double? ratioHeight;
  final Widget child;
  final Color? backgroundColor;

  const AppSizeScale(
      {super.key,
      this.ratioWidth,
      this.ratioHeight,
      required this.child,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (ratioWidth != null) ? (size.width * ratioWidth!) : null;
    final height = (ratioHeight != null) ? (size.height * ratioHeight!) : null;
    return ColoredBox(
        color: backgroundColor ?? Colors.transparent,
        child: SizedBox(width: width, height: height, child: child));
  }
}
