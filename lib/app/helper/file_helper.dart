import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

enum FileType {
  other({'other'}),
  image({'jpg', 'jpeg', 'png', 'gif', 'webp'}),
  video({'mp4', 'mov', 'avi', 'flv', 'wmv'}),
  pdf({'pdf'}),
  audio({'mp3', 'wav', 'aac', 'flac', 'm4a'});

  final Set<String> extensions;

  const FileType(this.extensions);
}

class FileHelper {
  static Future<String?> getDirectory() async => await FilePicker.platform.getDirectoryPath();

  static String getFileName(String path) => path.split('/').last;

  static Future<File?> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }

  static Future<File?> takePhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }

  static Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.path == null) return null;
      return File(file.path!);
    } else {
      print('No file selected.');
      return null;
    }
  }

  static FileType getFileType({required File file}) {
    final ext = file.path.split('.').last;

    if (FileType.image.extensions.contains(ext)) {
      return FileType.image;
    }
    if (FileType.video.extensions.contains(ext)) {
      return FileType.video;
    }
    //
    // if (FileType.audio.extensions.contains(ext)) {
    //   return FileType.audio;
    // }
    // if (FileType.pdf.extensions.contains(ext)) {
    //   return FileType.pdf;
    // }
    return FileType.other;
  }
}
