import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'layout/mobile/group_chat_mobile_screen.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(mobileView: GroupChatMobileScreen());
  }
}
