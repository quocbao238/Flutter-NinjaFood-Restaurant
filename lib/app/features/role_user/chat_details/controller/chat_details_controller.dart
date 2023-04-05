import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';

class ChatDetailsController extends BaseController {
  final TabsController tabsController;
  final AuthController authController;

  ChatDetailsController({required this.tabsController, required this.authController});

  Rx<ChatModel> chatModel = Rx<ChatModel>(Get.arguments as ChatModel);
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    print('ChatDetailsController onInit');
    authController.chatList.listen((p0) {
      if (p0.isNotEmpty) {
        chatModel.value = p0[0];
        if (scrollController.hasClients) {
          print('ChatDetailsController scroll');
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => {
        if (scrollController.hasClients)
          {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            )
          }
      },
    );
    if (authController.isAdmin)
      authController.dbController.listenMessageUser(chatModel.value.receiverUser.uid).listen((event) {
        final messages = event.docs.map((e) => MessageChat.fromJson(e.data())).toList();
        chatModel.value = chatModel.value.copyWith(messageChats: messages);
      });

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  void onPressedBack() {
    Get.back();
  }

  Future<void> onSendMessage() async {
    final currentUserId = authController.currentUser?.uid;
    final adminUserId = authController.adminUser?.uid;
    final isUser = authController.isUser();
    if (currentUserId == null || adminUserId == null) {
      throw Exception('currentUserId or adminUserId is null');
    }
    if (textEditingController.text.isEmpty) return;

    if (isUser) {
      final MessageChat messageChat = MessageChat.createMessageChat(
          uid: currentUserId,
          senderId: currentUserId,
          receiverId: adminUserId,
          message: textEditingController.text,
          messageChatType: MessageChatType.text);
      await authController.dbController.insertMessageChat(
        messageChat: messageChat,
        currentUserModel: authController.currentUser!,
      );
      return;
    }

    final MessageChat messageChat = MessageChat.createMessageChat(
        uid: chatModel.value.receiverUser.uid,
        senderId: adminUserId,
        receiverId: chatModel.value.receiverUser.uid,
        message: textEditingController.text,
        messageChatType: MessageChatType.text);
    await authController.dbController.insertMessageChat(
      messageChat: messageChat,
      currentUserModel: authController.currentUser!,
    );
  }
}
