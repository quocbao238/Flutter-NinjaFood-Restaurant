import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/services/services.dart';

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
      // Create a reference to the image location in Firebase Storage
      final fileName = createTimeStamp();
      final ref = storage.ref().child('chatImages/$fileName');
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
  int priority = 0;
}
