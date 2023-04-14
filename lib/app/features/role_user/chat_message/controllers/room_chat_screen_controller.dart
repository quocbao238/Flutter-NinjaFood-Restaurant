import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/chat_message/infrastructure/select_chat_files/select_chat_files.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'RoomChatScreenController';

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

  // create Rx null SelectChatFilesImpl
  final Rx<SelectChatFilesImpl> selectChatFiles = Rx<SelectChatFilesImpl>(SelectChatTextOnly());
  final RxList<File> selectedFiles = <File>[].obs;

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

    WidgetsBinding.instance
        .addPostFrameCallback((_) => Future.delayed(Duration(milliseconds: 500)).then((value) => _animateToBottom()));

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

  void _animateToBottom() {
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

  void onPressedBack() => Get.back();

  // Function Logic
  Future<void> onSendMessage() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final isAdmin = userController.getCurrentUser?.isAdmin() ?? false;
    final _receiverUser = isAdmin ? receiverUser : null;
    if (selectChatFiles.value is SelectChatTextOnly) {
      if (textEditingController.text.isEmpty) return;
      loading.value = true;
      final response = await messageController.sendMessage(
          message: textEditingController.text,
          receiverUser: _receiverUser,
          messageChatType: selectChatFiles.value.messageChatType);
      response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) => _clearAllSeason());
      loading.value = false;
      return;
    }
    if (selectedFiles.isEmpty) return;
    loading.value = true;
    final chatFiles = await selectChatFiles.value.uploadFileToStorage(selectedFiles);
    if (chatFiles.isEmpty) return;
    final messageChat =
        selectChatFiles.value.createMessageChat(message: textEditingController.text, chatFiles: chatFiles);
    final response = await messageController.sendMessage(
      message: messageChat.toJson(),
      receiverUser: _receiverUser,
      messageChatType: selectChatFiles.value.messageChatType,
    );
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) => _clearAllSeason());
    loading.value = false;
  }

  Future<void> onSelectedFile(SelectChatFilesImpl selectChatFilesImpl) async {
    selectChatFiles.value = selectChatFilesImpl;
    FocusManager.instance.primaryFocus?.unfocus();
    final _files = await selectChatFilesImpl.selectFile();
    if (_files.isEmpty) return;
    selectedFiles.assignAll(_files);
  }

  // Select more File
  Future<void> onPressedSelectMoreImages() async {
    final _fileResults = await FileHelper.pickImages();
    final _selectedFilesName = selectedFiles.map((e) => FileHelper.getFileName(e.path)).toList();
    final _files =
        _fileResults.where((element) => !_selectedFilesName.contains(FileHelper.getFileName(element.path))).toList();
    selectedFiles.addAll(_files);
  }

  void _clearAllSeason() {
    textEditingController.clear();
    selectChatFiles.value = SelectChatTextOnly();
    selectedFiles.clear();
  }

  void onRemoveImage(int index) {
    selectedFiles.removeAt(index);
    if (selectedFiles.isEmpty) selectChatFiles.value = SelectChatTextOnly();
  }

  Future<void> downloadFile(String fileUrl) async {
    loading.value = true;
    File? _resultFile = await FileHelper.downloadFile(fileUrl);
    loading.value = false;
    if (_resultFile == null) return;
    FileHelper.openFileByPath(_resultFile.path);
  }

}
