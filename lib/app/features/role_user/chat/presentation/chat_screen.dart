import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      body: Center(
        child: Text('CardScreen'),
      ),
    );
  }
}
