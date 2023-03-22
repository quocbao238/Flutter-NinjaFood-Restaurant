import 'package:flutter/material.dart';

class PaymentMethodButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const PaymentMethodButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(height: 75, width: MediaQuery.of(context).size.width, child: child),
    );
  }
}
