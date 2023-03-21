import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/upload_photo/presentation/layout/mobile/upload_photo_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: UploadPhotoMobileView(),
    );
  }
}
