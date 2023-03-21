import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePayment;
  const PaymentButton({
    super.key,
    required this.onPressed,
    required this.imagePayment,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 0),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
      onPressed: onPressed,
      child: SizedBox(
        height: kToolbarHeight,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(imagePayment),
      ),
    );
  }
}
