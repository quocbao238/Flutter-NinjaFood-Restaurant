import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

class ChatScreenController extends BaseController {
  RxList<ChatModel> chatList = <ChatModel>[].obs;

  @override
  void onInit() {
    // authController.chatList.listen((event) {
    //   chatList.assignAll(event);
    // });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapChat(ChatModel chatModel) {
    Get.toNamed(AppRouteProvider.chatDetailsScreen, arguments: chatModel);
  }

  Future<void> handleOnTapChat() async {
    //   final currentUserId = authController.currentUser?.uid;
    //   final adminUserId = authController.adminUser?.uid;
    //   if (currentUserId == null || adminUserId == null) {
    //     throw Exception('currentUserId or adminUserId is null');
    //   }
    //
    //   final MessageChat messageChat = MessageChat.createMessageChat(
    //       uid: currentUserId,
    //       senderId: currentUserId,
    //       receiverId: adminUserId,
    //       message: 'Hello',
    //       messageChatType: MessageChatType.text);
    //   final response = await databaseController.insertMessageChat(
    //     messageChat: messageChat, currentUserModel: authController.currentUser!,);
    //   response.fold((l) => print(l), (r) {
    //     // Get.toNamed(AppRouteProvider.chatDetailsScreen);
    //   });
  }
}
