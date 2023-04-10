part of 'select_chat_files.dart';


class SelectChatVideos extends CreateMessageChatFiles implements SelectChatFilesImpl {

  @override
  MessageChatType messageChatType = MessageChatType.video;

  @override
  // TODO: implement cloudStorageService
  CloudStorageService get cloudStorageService => CloudStorageService.instance;

  @override
  Future<List<File>> selectFile() async {
    final List<File> lstFile = <File>[];
    final List<File>? lstFilePicker = await FileHelper.pickVideos();
    if (lstFilePicker != null) {
      lstFile.addAll(lstFilePicker);
    }
    return lstFile;
  }
    @override
  Future<List<ChatFileModel>> uploadFileToStorage(List<File> files) async {
    List<ChatFileModel> chatFilesModel = <ChatFileModel>[];
    await Future.forEach<File>(files, (_file) async {
      await cloudStorageService.uploadVideo(file: _file).then((value) {
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
