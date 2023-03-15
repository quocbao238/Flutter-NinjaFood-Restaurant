import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignUpMobileScreen extends GetView {
  const SignUpMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                AppText.bodyLarge(text: 'Login To Your Account'),
                SizedBox(
                  child: Column(
                    children: [
                      AppPadding(padding: AppEdgeInsets.small(), child: AppTextFormField()),
                      AppTextFormField(),
                    ],
                  ),
                ),
                AppPadding.medium(child: AppText(text: 'Or Continue With')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 57,
                      width: 152,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 57,
                      width: 152,
                      color: Colors.amber,
                    ),
                  ],
                ),
                AppText(text: 'Forgot Your Password?'),
                AppButton.min(
                  title: 'Login',
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
