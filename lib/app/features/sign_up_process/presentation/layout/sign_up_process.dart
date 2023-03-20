import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/sign_up_process/presentation/layout/mobile/sign_up_process_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignUpProcessScreen extends StatelessWidget {
  const SignUpProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpProcessMobileScreen(),
    );
  }
}
