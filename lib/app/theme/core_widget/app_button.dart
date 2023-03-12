import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;
  final void Function()? onTap;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Radius? radius;

  const AppButton(
      {super.key,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.buttonStyle,
      this.onTap,
      required this.child,
      this.foregroundColor,
      this.backgroundColor,
      this.radius});

  const AppButton.rectangle(
      {super.key,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.buttonStyle,
      this.onTap,
      required this.child,
      this.foregroundColor,
      this.backgroundColor})
      : radius = const Radius.circular(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              elevation: 0,
              padding: padding,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
            ),
        child: Center(child: child),
      ),
    );
  }
}
