part of room_chat_widgets;

class RoomChatAppBarWidget extends GetView<RoomChatScreenController> {
  const RoomChatAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButtonBack(onPressed: controller.onPressedBack),
        Expanded(
            child: AppPadding(
                padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
                child: Center(child: AppText.headlineSmall(maxLines: 1, text: controller.receiverUser.getName())))),
        AppPadding(
          padding: const AppEdgeInsets.only(
              top: AppGapSize.paddingMedium,
              left: AppGapSize.paddingMedium,
              right: AppGapSize.paddingMedium),
          child: AppNetworkImage(borderRadius: 45, width: 45, height: 45, url: controller.receiverUser.photoUrl ?? ''),
        )
      ],
    );
  }
}
