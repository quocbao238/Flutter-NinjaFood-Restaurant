part of 'edit_profile_mobile_view.dart';

class CircleAvatarWithEditButton extends GetView<EditProfileController> {
  const CircleAvatarWithEditButton();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final avatarSize = screenSize.width * 0.2;
    final ratioSize = 4.2;

    return Obx(() {
      final imageUrl = controller.imageFile.value?.path ?? controller.currentUser.value?.photoUrl ?? '';
      return CircleAvatar(
        backgroundImage:
            !imageUrl.contains('http') ? FileImage(File(imageUrl)) : NetworkImage(imageUrl) as ImageProvider<Object>?,
        radius: avatarSize,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () => controller.onPickerImage(),
                  child: Container(
                    width: (avatarSize / ratioSize) * 3.5,
                    height: (avatarSize / ratioSize) * 2,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.labelDarkColor.withOpacity(0.7),
                        border: Border.all(color: ThemeColors.labelDarkColor.withOpacity(0.7), width: 2.0)),
                    child: AppPadding.small(
                      child: Center(child: Icon(FontAwesomeIcons.penToSquare, size: 14.0)),
                    ),
                  ),
                ))
          ],
        ),
      );
    });
  }
}
