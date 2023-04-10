part of 'select_chat_files.dart';

class SelectChatTextOnly  implements SelectChatFilesImpl, CreateMessageChatFiles {

  @override
  CloudStorageService get cloudStorageService => throw UnimplementedError();

  @override
  MessageChatType messageChatType = MessageChatType.text;

  @override
  Future<List<File>> selectFile() async {
    throw Exception('Not support this type');
  }

  @override
  Future<List<ChatFileModel>> uploadFileToStorage(List<File> files) async {
    throw Exception('Not support this type');
  }

  @override
  MessageChatFile createMessageChat({required String message, required List<ChatFileModel> chatFiles}) {
    throw Exception('Not support this type');
  }
}
