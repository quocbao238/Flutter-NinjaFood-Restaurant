import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum FileType {
  other({'other'}),
  image({'jpg', 'jpeg', 'png', 'gif', 'webp'}),
  video({'mp4', 'mov', 'avi', 'flv', 'wmv'}),
  another({'pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'rtf'});

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

  static Future<List<File>> pickImages() async {
    final imageFiles = await ImagePicker().pickMultiImage();
    if (imageFiles.isNotEmpty) {
      return imageFiles.map((e) => File(e.path)).toList();
    }

    print('No image selected.');
    return [];
  }

  static Future<List<File>> pickVideos() async {
    final imageFiles = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (imageFiles != null) {
      return [File(imageFiles.path)];
    }
    print('No image selected.');
    return [];
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

  static FileType? getFileType({required File file}) {
    final ext = file.path.split('.').last;

    if (FileType.image.extensions.contains(ext)) {
      return FileType.image;
    }
    if (FileType.video.extensions.contains(ext)) {
      return FileType.video;
    }
    if (FileType.another.extensions.contains(ext)) {
      return FileType.another;
    }
    return throw Exception('File type is not supported');
  }

  static IconData getIconByExtension(String extension) {
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'txt':
      case 'rtf':
        return Icons.text_fields;
      default:
        return Icons.insert_drive_file;
    }
  }
}
