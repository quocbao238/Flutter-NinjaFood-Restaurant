part of 'select_chat_files.dart';

class SelectAnotherFiles extends CreateMessageChatFiles implements SelectChatFilesImpl {
  @override
  CloudStorageService get cloudStorageService => CloudStorageService.instance;

  @override
  MessageChatType messageChatType = MessageChatType.anotherFile;

  @override
  Future<List<File>> selectFile() async {
    final File? lstFilePicker = await FileHelper.pickFile();
    if (lstFilePicker != null) {
      return [lstFilePicker];
    }
    return [];
  }

  @override
  Future<List<ChatFileModel>> uploadFileToStorage(List<File> files) async {
    List<ChatFileModel> chatFilesModel = <ChatFileModel>[];
    await Future.forEach<File>(files, (_file) async {
      await cloudStorageService.uploadAnotherFile(file: _file).then((value) {
        chatFilesModel.add(
          ChatFileModel(
            fileUrl: value ?? '',
            fileType: FileHelper.getFileType(file: _file).toString(),
            fileName: FileHelper.getFileName(_file.path),
          ),
        );
      });
    });
    return chatFilesModel;
  }
}
