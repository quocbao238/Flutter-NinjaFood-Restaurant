import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

import 'mobile/sign_in_mobile_view.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(mobileView: SignInMobileScreen());
  }
}
