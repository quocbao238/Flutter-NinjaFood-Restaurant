import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/provider/auth_provider.dart';

class UploadPhotoController extends BaseController {
  final AuthProvider authProvider;

  UploadPhotoController({required this.authProvider});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedFromGallery() {}

  void onPressedTakePhoto() {}

  void onPressedNext() {}
}
