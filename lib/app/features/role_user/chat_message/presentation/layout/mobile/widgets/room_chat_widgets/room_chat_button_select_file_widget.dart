import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ninjafood/app/widgets/animated_floating_buttons.dart';

class RoomChatButtonSelectFileWidget extends StatelessWidget {
  const RoomChatButtonSelectFileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight * 10,
      width: kToolbarHeight,
      child: AnimatedFloatingButtons(
          onPressedCallBack: (index) => print(index),
          iconItems: [
            FontAwesomeIcons.fileLines,
            FontAwesomeIcons.filePdf,
            FontAwesomeIcons.image,
            FontAwesomeIcons.fileVideo
          ],
          primaryButtonIcon: FontAwesomeIcons.fileArrowUp),
    );
  }
}
