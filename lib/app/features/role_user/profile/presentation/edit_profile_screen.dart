import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/edit_profile_mobile_view/edit_profile_mobile_view.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: EditProfileMobileScreen(),
    );
  }
}
