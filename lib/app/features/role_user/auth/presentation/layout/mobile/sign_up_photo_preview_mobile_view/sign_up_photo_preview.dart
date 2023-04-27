import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';

class SignUpPhotoPreview extends GetView<SignUpProcessController> {
  final VoidCallback removePhoto;

  const SignUpPhotoPreview({super.key, required this.removePhoto});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: Image.file(controller.imageFile!).image,
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
                onTap: removePhoto,
                child:
                    SizedBox(height: 30, width: 30, child: AppIcons.close()))),
      ],
    );
  }
}
