
import 'package:flutter/material.dart';




class OnboardScreen extends StatelessWidget {
  static const String route = 'onboardScreen';
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Onboard Screen App Bar'),
      ),
      body: Center(
        child: Text('OnBoard Screen'),
      ),
    );
  }
}