part of 'select_chat_files.dart';

abstract class SelectChatFilesImpl {
  final CloudStorageService cloudStorageService = CloudStorageService.instance;
  late final MessageChatType messageChatType;

  Future<List<File>> selectFile();

  Future<List<ChatFileModel>> uploadFileToStorage(List<File> files);

  MessageChatFile createMessageChat({required String message, required List<ChatFileModel> chatFiles}) {
    return MessageChatFile(message: message, lstFiles: chatFiles);
  }
}

abstract class CreateMessageChatFiles {
  MessageChatFile createMessageChat({required String message, required List<ChatFileModel> chatFiles}) {
    return MessageChatFile(message: message, lstFiles: chatFiles);
  }
}
