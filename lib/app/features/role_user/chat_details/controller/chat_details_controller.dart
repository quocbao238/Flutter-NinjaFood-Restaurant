import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/globalController/message_controller.dart';
import 'package:ninjafood/app/globalController/userController.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class ChatDetailsController extends BaseController {
  final DatabaseService databaseService = DatabaseService.instance;
  final MessageController messageController = MessageController.instance;
  final UserController userController = UserController.instance;
  late final GroupChatModel groupChatModel;

  late final UserModel receiverUser;
  late final UserModel senderUser;

  StreamSubscription? streamListChat;
  final RxList<MessageChat> lstChatMessage = <MessageChat>[].obs;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    groupChatModel = Get.arguments;
    final currentUser = userController.getCurrentUser!;
    receiverUser = {groupChatModel.receiverUser, groupChatModel.senderUser}
        .firstWhere((element) => element.uid != currentUser.uid);
    senderUser = {groupChatModel.receiverUser, groupChatModel.senderUser}
        .firstWhere((element) => element.uid == currentUser.uid);

    _listenChatByGroupChatId(groupChatModel.groupChatId);
    lstChatMessage.listen((p0) {
      if (p0.isNotEmpty) {
        Future.delayed(Duration(milliseconds: 500)).then((value) => _animateToBottom());
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500)).then((value) => _animateToBottom());
    });

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    streamListChat?.cancel();
    super.dispose();
  }

  _listenChatByGroupChatId(String groupChatId) {
    streamListChat = databaseService.listenMessageChatByGroupChat(groupChatId: groupChatId).listen((event) {
      final messages = event.docs.map((e) => MessageChat.fromJson(e.data())).toList().reversed;
      lstChatMessage.assignAll(messages);
    });
  }

  void onPressedBack() {
    Get.back();
  }

  Future<void> onSendMessage() async {
    if (textEditingController.text.isEmpty) return;

    FocusManager.instance.primaryFocus?.unfocus();
    final isAdmin = userController.getCurrentUser?.isAdmin() ?? false;
    final response = await messageController.sendMessage(
        message: textEditingController.text, receiverUser: isAdmin ? receiverUser : null);
    response.fold((l) => print(l), (r) {
      textEditingController.clear();
    });
  }

  _animateToBottom() {
    if (scrollController.hasClients) {
      print('ChatDetailsController scroll');
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
    }
  }
}
