import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/upload_preview/controller/upload_preview_controller.dart';

class PhotoPreview extends StatelessWidget {
  final VoidCallback removePhoto;
  const PhotoPreview({super.key, required this.removePhoto});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UploadPreviewController>();

    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: Image.file(controller.imageFile).image,
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 10,
          right: 11,
          child: GestureDetector(
              onTap: removePhoto,
              child: SizedBox(height: 30, width: 30, child: AppIcons.close()))
        ),
      ],
    );
  }
}