part of 'select_chat_files.dart';

class SelectChatImages extends CreateMessageChatFiles implements SelectChatFilesImpl {
  @override
  CloudStorageService get cloudStorageService => CloudStorageService.instance;

  @override
  MessageChatType messageChatType = MessageChatType.image;

  @override
  Future<List<File>> selectFile() async {
    final List<File> lstFile = <File>[];
    final List<File>? lstFilePicker = await FileHelper.pickImages();
    if (lstFilePicker != null) {
      lstFile.addAll(lstFilePicker);
    }
    return lstFile;
  }

  @override
  Future<List<ChatFileModel>> uploadFileToStorage(List<File> files) async {
    List<ChatFileModel> chatFilesModel = <ChatFileModel>[];
    await Future.forEach<File>(files, (_file) async {
      await cloudStorageService.uploadImage(file: _file).then((value) {
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
