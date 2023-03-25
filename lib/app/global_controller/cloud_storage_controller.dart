part of global_controller;

class CloudStorageController extends GetxService {
  late final FirebaseStorage storage;

  Future<void> call() async {
    storage = FirebaseStorage.instance;
    // call api here
  }

  Future<String?> updateUserPhoto(File file, String uid) async {
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
}
