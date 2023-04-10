part of room_chat_widgets;

class RoomChatFileView extends StatelessWidget {
  final File file;
  final VoidCallback onRemoveImage;

  const RoomChatFileView({Key? key, required this.onRemoveImage, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fileType = FileHelper.getFileType(file: file);
    return AppPadding.small(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5),
              borderRadius: BorderRadius.circular(8),
              image: fileType == FileType.image
                  ? DecorationImage(
                      image: FileImage(file),
                      fit: BoxFit.cover,
                    )
                  : null),
          child: Stack(
            children: [
              Builder(builder: (context) {
                switch (fileType) {
                  case FileType.video:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Icon(Icons.video_library, size: 24, color: Theme.of(context).colorScheme.primary)),
                        AppPadding.small(
                          child: AppText.bodySmall(text: FileHelper.getFileName(file.path), maxLines: 2),
                        ),
                      ],
                    );
                  case FileType.another:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child:
                                Icon(Icons.insert_drive_file, size: 24, color: Theme.of(context).colorScheme.primary)),
                        AppPadding.small(
                          child: AppText.bodySmall(text: FileHelper.getFileName(file.path), maxLines: 2),
                        ),
                      ],
                    );
                  default:
                    return Container();
                }
              }),
              // Delete widget right top
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: onRemoveImage,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
                    ),
                    child: Icon(Icons.close, size: 16, color: Theme.of(context).colorScheme.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
