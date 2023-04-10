import 'dart:io';

abstract class CloudStorageServiceImpl {
  Future<String?> uploadAvatarImage({required File file, required String uid});
  Future<String?> uploadImage({required File file});
  Future<String?> uploadVideo({required File file});
}
