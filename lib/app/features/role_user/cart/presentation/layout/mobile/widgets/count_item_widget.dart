import 'package:flutter/material.dart';

class CountItemWidget extends StatelessWidget {
  final Color boxColor;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const CountItemWidget({
    super.key,
    required this.boxColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 26,
        width: 26,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: boxColor),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}