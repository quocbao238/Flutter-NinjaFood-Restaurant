import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      body: Center(
        child: Text('CardScreen'),
      ),
    );
  }
}
