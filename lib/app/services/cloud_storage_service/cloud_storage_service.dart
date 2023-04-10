import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/services/services.dart';
import 'package:uuid/uuid.dart';

import '../boot_services.dart';
import 'cloud_storage_impl.dart';

class CloudStorageService extends GetxService implements BootableService, CloudStorageServiceImpl {
  static CloudStorageService get instance => Get.find<CloudStorageService>();

  late final FirebaseStorage storage;

  Future<void> call() async {
    Get.put(this, permanent: true);
    storage = FirebaseStorage.instance;
  }

  Future<String?> uploadAvatarImage({required File file, required String uid}) async {
    try {
      // Create a reference to the image location in Firebase Storage
      final fileName = uid;
      final ref = storage.ref().child('user/$fileName');
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );
      final uploadTask = await ref.putFile(File(file.path), metadata);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  @override
  Future<String?> uploadImage({required File file}) async {
    try {
      final ref = storage.ref().child('images/${Uuid().v4()}');
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );
      final uploadTask = ref.putFile(file, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  @override
  Future<String?> uploadVideo({required File file}) async {
    try {
      final storage = FirebaseStorage.instance;
      final ref = storage.ref().child('videos/${Uuid().v4()}');
      final metadata = SettableMetadata(
        contentType: 'video/mp4',
        customMetadata: {'picked-file-path': file.path},
      );
      final uploadTask = ref.putFile(file, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      final videoUrl = await snapshot.ref.getDownloadURL();
      return videoUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  Future<String?> uploadAnotherFile({required File file}) async {
    try {
      final ref = storage.ref().child('files/${Uuid().v4()}');
      final metadata = SettableMetadata(
        contentType: 'application/pdf',
        customMetadata: {'picked-file-path': file.path}
      );
      final uploadTask = ref.putFile(file, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }
}
