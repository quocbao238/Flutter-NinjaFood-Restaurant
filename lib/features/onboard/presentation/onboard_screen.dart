import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ninjafood/features/onboard/presentation/body_onboarding.dart';
import 'package:ninjafood/features/onboard/presentation/splash_widget.dart';
import 'package:page_transition/page_transition.dart';

class OnboardScreen extends StatelessWidget {
  static const String route = 'onboardScreen';
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: AnimatedSplashScreen(
      //   splash: SplashWidget(),
      //   splashTransition: SplashTransition.fadeTransition,
      //   pageTransitionType: PageTransitionType.fade,
      //   splashIconSize: double.infinity,
      //   duration: 1000,
      //   nextScreen: Onboarding(),
      // ),
      body: Onboarding(),
    );
  }
}
