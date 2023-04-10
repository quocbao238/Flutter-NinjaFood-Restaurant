part of room_chat_widgets;

class RoomChatBottomSendWidget extends GetView<RoomChatScreenController> {
  const RoomChatBottomSendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listFile = controller.selectedFiles;
      return Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: TextField(
              textInputAction: TextInputAction.send,
              onSubmitted: (value) => controller.onSendMessage(),
              style: Theme.of(context).textTheme.bodyMedium,
              controller: controller.textEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                prefixIcon: listFile.isEmpty ? SizedBox(width: kToolbarHeight, height: kToolbarHeight) : null,
                suffixIcon: InkWell(
                  onTap: () => controller.onSendMessage(),
                  child: AppPadding.medium(child: AppIcons.sendMessage()),
                ),
              ),
            ),
          ),
          listFile.isEmpty
              ? SizedBox()
              : Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.background.withOpacity(0.6),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.background.withOpacity(0.6),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, -1), // changes position of shadow
                        )
                      ]),
                  child: Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: [
                    ...listFile.map((e) {
                      final index = listFile.indexOf(e);
                      return RoomChatFileView(onRemoveFile: () => controller.onRemoveImage(index), file: e);
                    }).toList(),
                    Obx(() {
                      final selectChatFiles = controller.selectChatFiles.value;
                      if (selectChatFiles is !SelectChatImages) return SizedBox.shrink();
                      return AppPadding.small(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                                onTap: () => controller.onPressedSelectMoreImages(),
                                child: Icon(FontAwesomeIcons.plus)),
                          ),
                        ),
                      );
                    }),
                  ]),
                ),
        ],
      );
    });
  }
}
