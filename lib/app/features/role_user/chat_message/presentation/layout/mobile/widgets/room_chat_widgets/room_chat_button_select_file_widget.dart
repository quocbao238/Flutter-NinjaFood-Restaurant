part of room_chat_widgets;


class RoomChatButtonSelectFileWidget extends GetView<RoomChatScreenController> {
  const RoomChatButtonSelectFileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final typeFilesInput = controller.selectChatFiles.value;
      if (typeFilesInput is  !SelectChatTextOnly) {
        return const SizedBox();
      }
      return SizedBox(
        height: kToolbarHeight * 10,
        width: kToolbarHeight,
        child: AnimatedFloatingButtons(
            onPressedCallBack: (index) {
              if (index == 0) {
                controller.onSelectedFile(SelectAnotherFiles());
              }
              if (index == 1) {
                controller.onSelectedFile(SelectChatImages());
              }
              if (index == 2) {
                controller.onSelectedFile(SelectChatVideos());
              }
            },
            iconItems: [FontAwesomeIcons.fileArrowUp, FontAwesomeIcons.image, FontAwesomeIcons.fileVideo],
            primaryButtonIcon: FontAwesomeIcons.file),
      );
    });
  }
}
