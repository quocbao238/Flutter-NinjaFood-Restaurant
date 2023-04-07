import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/globalController/global_controller.dart';
import 'package:ninjafood/app/globalController/message_controller.dart';
import 'package:ninjafood/app/globalController/userController.dart';
import 'package:ninjafood/app/helper/file_helper.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class RoomChatScreenController extends BaseController {
  final DatabaseService databaseService = DatabaseService.instance;
  final MessageController messageController = MessageController.instance;
  final UserController userController = UserController.instance;
  final CloudStorageService cloudStorageService = CloudStorageService.instance;
  final DialogController dialogController = DialogController.instance;

  late final GroupChatModel groupChatModel;
  late final UserModel receiverUser;
  late final UserModel senderUser;

  StreamSubscription? streamListChat;
  final RxList<MessageChat> lstChatMessage = <MessageChat>[].obs;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  MessageChatType messageChatType = MessageChatType.text;

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

  void onPressedBack() => Get.back();

  Future<void> onSendMessage() async {
    if (textEditingController.text.isEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    final isAdmin = userController.getCurrentUser?.isAdmin() ?? false;
    final response = await messageController.sendMessage(
        message: textEditingController.text,
        receiverUser: isAdmin ? receiverUser : null,
        messageChatType: messageChatType);
    response.fold((l) => print(l), (r) {
      messageChatType = MessageChatType.text;
      textEditingController.clear();
    });
  }

  Future<void> onPressedAttachFile() async {
    final _filePicker = await FileHelper.pickFile();
    if (_filePicker == null) return;
    final getFileType = FileHelper.getFileType(file: _filePicker);
    if (getFileType == FileType.other) {
      return dialogController.showError(message: 'File is not supported');
    }
    String? urlFile;
    if (getFileType == FileType.image) {
      messageChatType = MessageChatType.image;
      urlFile = await cloudStorageService.uploadImage(file: _filePicker);
    } else if (getFileType == FileType.video) {
      messageChatType = MessageChatType.video;
      urlFile = await cloudStorageService.uploadVideo(file: _filePicker);
    }
    if (urlFile == null) return dialogController.showError(message: 'Upload file failed');
    final MessageChatFile messageChatFile = MessageChatFile(
      message: textEditingController.text.trim(),
      fileName: FileHelper.getFileName(_filePicker.path),
      fileType: getFileType.toString(),
      fileUrl: urlFile,
    );
    final messageStr = messageChatFile.toJson();
    final response = await messageController.sendMessage(
        message: messageStr, receiverUser: receiverUser, messageChatType: messageChatType);
    response.fold((l) => print(l), (r) {});
  }

  _animateToBottom() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) return;
      print('ChatDetailsController scroll');
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
    }
  }
}
